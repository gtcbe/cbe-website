class Admin::AdminController < ApplicationController

	before_action :signed_in_user
	before_action :admin_user

	private

		def signed_in_user
			unless signed_in?
				store_location
				redirect_to login_url, notice: "Please sign in."
			end
		end
		
		def admin_user
			redirect_to(root_url) unless current_user.is_administrator?
		end

end