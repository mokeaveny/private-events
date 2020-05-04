class UsersController < ApplicationController

	# Skips the user having to be logged in if they are creating a new user
	skip_before_action :login_required, :only => [:new, :create]
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Account created successfully!"
			redirect_to root_path
		else
			flash.now.alert = "Account couldn't be created!"
			render :new
		end
	end

	def show
		
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
	end

end

