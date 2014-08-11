class Blogpost < ActiveRecord::Base

	before_save do
		self.name = name.gsub(/\s+/, '_').underscore
	end
	
	after_save :reload_routes
	
	belongs_to :user, :foreign_key => :author_id
	has_many :comments, dependent: :destroy, as: :commentable
	
	def comment_count
		count = 0;
		comments.each do |comment|
			count += comment.comments.count
		end
		count += comments.count
	end

	default_scope -> { order('created_at DESC') }
	validates :name, presence: true, length: { maximum: 140 }, uniqueness: { case_sensitive: false }
	validates :title, presence: true, length: { maximum: 140 }, uniqueness: { case_sensitive: false }
	
	private
	
		def reload_routes
			DynamicRouter.reload
		end
	
end
