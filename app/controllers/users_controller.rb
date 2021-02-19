class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		if user_signed_in?
			redirect_to user_path(current_user) unless params[:id].to_i == current_user.id || current_user.is_admin
		else
			redirect_to new_user_session_path
		end
	end
end
