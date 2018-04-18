class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		#@user = User.find_by_email(params[:email].downcase)


		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.password==params[:session][:password]
			session[:user]=user


			cookies.permanent.signed[:user_id] = @user.id
			flash.now[:notice] = "User logged in successfully"
			redirect_to user_path(user)
		else
			flash.now[:notice] = "Log in failed"
			redirect_to root_path
		end
	end

	def destroy
		#complete this method
		@_current_user = session[:current_user_id] = nil
		flash.now[:notice] = "Logged out"
		redirect_to log_out_path
	end
end
