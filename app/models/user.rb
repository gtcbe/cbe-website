class User < ActiveRecord::Base

	has_many :blogposts, dependent: :destroy, :foreign_key => :author_id
	has_many :comments
	
	has_attached_file :avatar, :styles => { :small => "100x100>", :large => "500x500>" },
											:url => "/assets/products/:id/:style/:basename.:extension",
											:path => ":rails_root/public/assets/products/:id/:style/:basename.:extension",
											:processors => [:cropper]
	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
	after_update :reprocess_avatar, :if => :cropping?
	
	before_save { self.email = email.downcase }
	before_create :create_session_token

	validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
	
	validates :email, presence: true, uniqueness: { case_sensitive: false }

	validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	
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
	
	def cropping?
		doCrop = !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
	end
	
	def avatar_geometry(style = :original)
		@geometry ||= {}
		@geometry[style] ||= Paperclip::Geometry.from_file(avatar.path(style))
	end
	
	private
	
		def create_session_token
			self.session_token = User.digest(User.new_session_token)
		end
		
		def reprocess_avatar
			avatar.assign(avatar)
			avatar.save
		end
	
end
