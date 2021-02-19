class Admin::EventsController < ApplicationController
	before_action :redirect_if_not_global_admin
	def validate
		@event = Event.find(params[:id])
		@event.validate_event
		redirect_to "/admin"
	end

	def destroy
		 @event = Event.find(params[:id])
  	@event.destroy
  	redirect_to "/admin"
	end
end
