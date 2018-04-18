class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    @user = User.new(registration_params)
	    if  @user.save
				flash.now[:notice] = "User created successfully"
				redirect_to root_path

	    else

				flash.now[:notice] = "Create user again"
				redirect_to sign_in_path
		

		end
	
	end
	def registration_params
		params.require( :registrations).permit(:name, :last_name, :email, :password, :phone)
	end

end
