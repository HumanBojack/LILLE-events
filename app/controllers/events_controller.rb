class EventsController < ApplicationController
	before_action :redirect_if_not_auth, only: [:new, :create]
	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		@event.user = current_user
		if @event.save
			redirect_to event_path(@event)
		else
			render :new
		end
	end

  def index
  	@events = Event.all
  end

  def show
  	@event = Event.find(params[:id])
  end

  private
  def event_params
  	params.require(:event).permit(:title, :start_date, :duration, :description, :price, :location)
  end
end
