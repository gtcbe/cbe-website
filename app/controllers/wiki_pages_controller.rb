class WikiPagesController < ApplicationController

def home
	@hierarchies = WikiHierarchy.all
	@wiki_page = WikiPage.first
	loadComentsFor(@wiki_page)
	render :action => "show"
end

def default
	page_name = params[:page_name]
	text = "This page does not exist yet"
	@wiki_page = WikiPage.new(name: page_name, title: page_name.humanize, text: text)
end

def show
	@hierarchies = WikiHierarchy.all
	@wiki_page = WikiPage.find(params[:id])
	loadComentsFor(@wiki_page)
end

	private

		def loadComentsFor(page)
			@comments = page.comments.to_a
			
			if signed_in?
				@comment = page.comments.build
			end
		end

end
