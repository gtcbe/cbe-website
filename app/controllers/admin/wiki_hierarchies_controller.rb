class Admin::WikiHierarchiesController < Admin::AdminController

	def index
		@hierarchies = WikiHierarchy.all
	end

	def update
		@hierarchy = WikiHierarchy.find(params[:id])
		@hierarchy.update_attributes(page_params)
		
		redirect_to action: "index"
	end
	
	private 
		
		def page_params
			params.require(:wiki_hierarchy).permit(:parent_id)
		end
	
end
