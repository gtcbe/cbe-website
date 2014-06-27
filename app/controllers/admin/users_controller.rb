class Admin::UsersController < Admin::AdminController
  
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		redirect_to admin_users_url
	end
  
	private
  
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

end
