class Admin::CommentsController <  Admin::AdminController

	def destroy
		Blogpost.find(params[:id]).destroy
		redirect_to admin_blogposts_url
	end

end
