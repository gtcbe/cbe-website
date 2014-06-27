require 'spec_helper'

describe User do
	
	before do
		@user = User.new(name: "Test", email: "test@gt.net", password: "12345", password_confirmation: "12345")
	end
	
	subject { @user }
	
	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:password_digest) }
	
	it { should be_valid }

	describe "when name is not present" do
		before { @user.name = " " }
		it { should_not be_valid }
	end

	describe "when email is not present" do
		before { @user.email = " " }
		it { should_not be_valid }
	end
	
	describe "when email is already taken" do
		before do
			other_user = @user.dup;
			other_user.email = @user.email.upcase
			other_user.save;
		end
		
		it { should_not be_valid }
	end
	
	describe "when username is already taken" do
		before do
			other_user = @user.dup;
			other_user.name = @user.name.upcase;
			other_user.save;
		end
		
		it { should_not be_valid }
	end

end
