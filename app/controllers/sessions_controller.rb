class SessionsController < ApplicationController

def create
	user = User.find_by( email: params[:session][:email].downcase)
	if user && user.authenticate(params[:session][:password] )
		sign_in(user)
		redirect_back_or request.referer
	else
		render :action => "new"
	end
end

def destroy
	sign_out
    redirect_to request.referer
end
  
	private
  
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
  

end
