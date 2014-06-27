module SessionsHelper

	def sign_in(user)
		session_token = User.new_session_token
		cookies.permanent[:session_token] = session_token
		user.update_attribute(:session_token, User.digest(session_token))
		self.current_user = user
	end
	
	def sign_out
		current_user.update_attribute(:session_token, User.digest(User.new_session_token))
		cookies.delete(:session_token)
		self.current_user = nil
	end
	
	def signed_in?
		!current_user.nil?
	end
	
	def signed_in_user
		unless signed_in?
			store_location
			redirect_to login_url, notice: "Please sign in." 
		end
	end
	
	def current_user= (user)
		@current_user = user
	end
	
	def current_user
		session_token = User.digest(cookies[:session_token])
		@current_user ||= User.find_by(session_token: session_token)
	end
	
	def current_user? (user)
		user == current_user
	end
	
	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end
	
	def store_location
		session[:return_to] = request.url if request.get?
	end
	
end
