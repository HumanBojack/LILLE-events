class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, only: [:create, :update], if: :devise_controller?


	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :email, :password, :password_confirmation, :description, :last_name)}
		devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :email, :password, :password_confirmation, :description, :last_name, :current_password)}
	end

	def redirect_if_not_auth
		redirect_to root_path unless user_signed_in?
	end

	def redirect_if_not_admin
		redirect_to root_path unless current_user.is_admin?(Event.find(params[:id]))
	rescue ActiveRecord::RecordNotFound
		redirect_to root_path unless current_user.is_admin?(Event.find(params[:event_id]))
	end

	def redirect_if_not_reviewed
		redirect_to root_path unless Event.find(params[:id]).validated || current_user.is_admin || Event.find(params[:id]).user == current_user
	end

	def redirect_if_not_global_admin
		redirect_to events_path unless current_user.is_admin == true
	end

end
