class WikiHierarchy < ActiveRecord::Base

	belongs_to :parent, class_name: "WikiPage"
	belongs_to :child, class_name: "WikiPage"

end
