class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :is_user_logged_in?, :current_user

  def index

  end

  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end

  def is_user_logged_in?
	#complete this method
    current_user.present?
  	logged_in = false
	if logged_in then true else redirect_to root_path end 
  end
end
