class WikiPage < ActiveRecord::Base

	before_save do
		self.name = name.gsub(/\s+/, '_').underscore
	end
	
	has_many :comments, dependent: :destroy, as: :commentable
	has_many :child_relations, class_name: "WikiHierarchy", dependent: :nullify , foreign_key: "parent_id"
	has_one :parent_relation, class_name: "WikiHierarchy", dependent: :destroy, foreign_key: "child_id"

	def comment_count
		count = 0;
		comments.each do |comment|
			count += comment.comments.count
		end
		count += comments.count
	end
	
	#default_scope -> { order('created_at DESC') }
	validates :name, presence: true, length: { maximum: 140 }, uniqueness: { case_sensitive: false }
	validates :title, presence: true, length: { maximum: 140 }, uniqueness: { case_sensitive: false }
	
end

