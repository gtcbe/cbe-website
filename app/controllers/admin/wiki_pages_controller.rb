class Admin::WikiPagesController < Admin::AdminController

	def index
		@pages = WikiPage.all
	end
  
	def new
		if 	page_name = params[:page_name]
			@page = WikiPage.new(name: page_name, title: page_name.humanize)
		else
			@page = WikiPage.new
		end
	end
	
	def create
		@page = WikiPage.create(page_params)
		if @page.save
			DynamicRouter.reload
			WikiHierarchy.create( parent_id: 0, child_id: @page.id)
			redirect_to @page
		else
			render 'new'
		end
	end
	
	def edit
		@page = WikiPage.find(params[:id])
	end
	
	def update
		@page = WikiPage.find(params[:id])
		if @page.update_attributes(page_params)
			DynamicRouter.reload
			redirect_to @page
		else
			render 'edit'
		end
	end
	
	def destroy
		page = WikiPage.find(params[:id])
		if page
			page.destroy
			DynamicRouter.reload
			redirect_to admin_wiki_pages_url
		end
	end
	
	
	private
  
		def page_params
			params.require(:wiki_page).permit(:name, :title, :text)
		end

end
