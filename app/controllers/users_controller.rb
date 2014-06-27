class UsersController < ApplicationController
  
  before_action :signed_in_user, only: [:show, :edit, :update, :delete ]
  before_action :correct_user, only: [:show, :edit, :update, :delete ]

def show
	@user = User.find(params[:id])
end

def new
	@user = User.new
end

def create
	@user = User.new(user_params)
	if @user.save
		sign_in(@user)
		redirect_to user_path(@user)
	else
		render 'new'
	end
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

def delete
end
  
  
	private
  
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
		
		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_url) unless current_user?(@user)
		end
end
