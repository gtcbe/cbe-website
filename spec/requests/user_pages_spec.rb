require 'spec_helper'

describe "UserPages" do

	subject { page }

	describe "Registration" do
		
		before { visit register_path }
	
		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button "Register" }.not_to change(User, :count)
			end
		end
	
		describe "with invalid information" do
			before do 
				fill_in "Name", with: "Test User"
				fill_in "Email", with: "test@gt.net"
				fill_in "Password", with: "12345"
				fill_in "Confirmation", with: "12345"
			end

			it "should create a user" do
				expect { click_button "Register" }.to change(User, :count).by(1)
			end
		end
		
	end

end
