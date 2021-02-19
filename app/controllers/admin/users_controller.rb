class Admin::UsersController < ApplicationController
	before_action :redirect_if_not_global_admin

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to "/admin"
	end
end
