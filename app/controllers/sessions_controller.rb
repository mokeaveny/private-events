class SessionsController < ApplicationController
	skip_before_action :login_required, :only => [:new, :create]

	def new
	end

	def create
		user = User.find_by(email: params[:login][:email].downcase)
		
		if user && user.authenticate(params[:login][:password])
			# Save the user.id in the user's session cookie
			session[:user_id] = user.id.to_s
			redirect_to root_path, notice: 'Successfully logged in!'
		else
			flash.now.alert = 'Incorrect email or password, try again!'
			render :new
		end
	end

	def destroy
		#Delete the saved user_id from the cookie
		session.delete(:user_id)
		redirect_to login_path, notice: "Logged out!"
	end
end
