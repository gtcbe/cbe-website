require 'spec_helper'

describe "AuthenticationPages" do
  
	describe "signin" do
		
		before { visit login_path }
		
		describe "with invalid information" do
			
		end
		
		describe "with valid information" do
			before do
				@user = User.create(name: "Test", email: "test@gt.net", password: "12345", password_confirmation: "12345")
				fill_in "Email", with: @user.email.upcase
				fill_in "Password", with: @user.password
				click_button "Log in"
			end

		end

	end
  
end
