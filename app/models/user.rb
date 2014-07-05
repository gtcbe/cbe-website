class User < ActiveRecord::Base

	has_many :blogposts, dependent: :destroy, :foreign_key => :author_id
	has_many :comments
	
	before_save { self.email = email.downcase }
	before_create :create_session_token

	validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
	
	validates :email, presence: true, uniqueness: { case_sensitive: false }

	has_secure_password

	def User.new_session_token
		SecureRandom.urlsafe_base64
	end
	
	def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end
	
	def increase_karma( count=1)
		update_attribute(:karma, karma + count)
	end
	
	def decrease_karma( count=1)
		update_attribute(:karma, karma - count)
	end
	
	def send_password_reset
		self.password_reset_token = User.digest(User.new_session_token)
		self.password_reset_sent_at = Time.zone.now
		save!
		UserMailer.password_reset(self).deliver
	end
	
	private
	
		def create_session_token
			self.session_token = User.digest(User.new_session_token)
		end
	
end
