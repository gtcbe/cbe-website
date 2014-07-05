class UserMailer < ActionMailer::Base
  default from: "noreply@contraband-empire.com"

  def send_signup_email(user)
	@user = user
	mail :to => user.email, :subject => "Welcome to the family!"
  end
  
  
  def password_reset(user)
    @user = user
	mail :to => user.email, :subject => "Password Reset"
  end
end
