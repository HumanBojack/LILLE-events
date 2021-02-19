class Admin::AdminController < ApplicationController
	before_action :redirect_if_not_global_admin
	def index
		@user = current_user
		@users = User.all
		@events = Event.all
	end
end
