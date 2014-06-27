class WikiHierarchy < ActiveRecord::Base

	validate :keys_not_equal
	validate :check_parent
	
	belongs_to :parent, class_name: "WikiPage"
	belongs_to :child, class_name: "WikiPage"

	private
	
		def keys_not_equal
		  errors.add(:parent_id, "object can't have a relation with itself") if parent_id == child_id
		end
		
		def check_parent
		  errors.add(:parent_id, "object must hava a valid parent") if !WikiPage.exists?(parent) && parent_id != nil && parent_id != 0
		end
	
end
