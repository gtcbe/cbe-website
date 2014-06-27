class BlogpostsController < ApplicationController

	def index
		@posts = Blogpost.all
	end

	def show
		@post = Blogpost.find(params[:id])
		@comments = @post.comments.to_a # cast to array necessary so we don't have the dummy comment in the list
		
		if signed_in?
			@comment = @post.comments.build
		end
	end

end
 