class WikiPage < ActiveRecord::Base

	before_save do
		self.name = name.gsub(/\s+/, '_').underscore
	end
	
	has_many :comments, dependent: :destroy, as: :commentable

	#default_scope -> { order('created_at DESC') }
	validates :name, presence: true, length: { maximum: 140 }, uniqueness: { case_sensitive: false }
	validates :title, presence: true, length: { maximum: 140 }, uniqueness: { case_sensitive: false }
	
end

