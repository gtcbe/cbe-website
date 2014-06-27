class Comment < ActiveRecord::Base

	acts_as_votable
	
	belongs_to :user
	belongs_to :commentable, polymorphic: true
	
	has_many :comments, dependent: :destroy, as: :commentable

	default_scope -> { order('created_at DESC') }
	validates :title, presence: true, length: { maximum: 140 }
	validates :text, presence: true
	
	def author
		User.find_by(id: user_id).try(:name) || "Deleted user"
	end
	
	def depth
		 if self.commentable_type != "Comment"
			0
		else
			1+self.commentable.depth
		end
	end
	
end
