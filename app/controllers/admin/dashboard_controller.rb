class Admin::DashboardController < Admin::AdminController

	def index
	end
  
  	private
  
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
	
end
