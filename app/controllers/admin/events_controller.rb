class Admin::EventsController < ApplicationController
	before_action :redirect_if_not_global_admin
	def validate
		@event = Event.find(params[:id])
		@event.validate_event
		redirect_to "/admin"
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		@event.update(event_params)
		puts params
		if @event.save
			redirect_to @event
		else
			render :new
		end
	end

	def destroy
		@event = Event.find(params[:id])
  	@event.destroy
  	redirect_to "/admin"
	end

	private
	def event_params
 		params.require(:event).permit(:title, :start_date, :duration, :description, :price, :location, :event_id, :event_picture )
  end
end
