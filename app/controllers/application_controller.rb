class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :login_required

	# Method checks if the user is signed in
	def login_required
		if !logged_in?
			redirect_to login_path, :notice => "Log in to create or attend an event"
		end
	end

	def logged_in?
		!!current_user
	end

	# Make the logged_in? method available to views, not just controllers
	helper_method :logged_in?

	def current_user
		if session[:user_id]
			@current_user = User.find(session[:user_id])
			@current_user
		else
			false
		end
	end

	# Make the current_user method available to views, not just controllers
	helper_method :current_user
	
end
