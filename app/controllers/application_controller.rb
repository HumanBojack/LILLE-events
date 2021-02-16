class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, only: [:create, :update]

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :email, :password, :password_confirmation, :description, :last_name)}
		devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :email, :password, :password_confirmation, :description, :last_name, :current_password)}
	end

	def redirect_if_not_auth
		redirect_to root_path unless user_signed_in?
	end
end
