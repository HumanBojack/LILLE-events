class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, only: [:create]

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :email, :password, :password_confirmation, :description, :last_name)}
	end
end
