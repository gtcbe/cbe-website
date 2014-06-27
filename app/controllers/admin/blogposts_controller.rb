class Admin::BlogpostsController < Admin::AdminController

	def index
		@posts = Blogpost.all
	end
  
	def new
		@post = Blogpost.new
	end
	
	def create
		@post = current_user.blogposts.create(post_params)
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end
	
	def edit
		@post = Blogpost.find(params[:id])
	end
	
	def update
		@post = Blogpost.find(params[:id])
		if @post.update_attributes(post_params)
			redirect_to admin_blogposts_url
		else
			render 'edit'
		end
	end
	
	def destroy
		Blogpost.find(params[:id]).destroy
		redirect_to admin_blogposts_url
	end
	
	
	private
  
		def post_params
			params.require(:blogpost).permit(:name, :title, :text)
		end
		
end
