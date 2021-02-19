class EventsController < ApplicationController
	before_action :redirect_if_not_auth, only: [:new, :create, :show]
	before_action :redirect_if_not_admin, only: [:edit, :update, :destroy]
	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		@event.user = current_user

		if @event.save	
			redirect_to event_path(@event)
		else
			flash.now.alert = "Erreur, vérifiez la longueur de vos champs. La durée doit être multiple de 5"
			render :new
		end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		@event.update(event_params)
		if @event.save
			redirect_to @event
		else
			render :new
		end
	end

  def index
  	@events = Event.all
  end

  def show
  	redirect_if_not_reviewed
  	@event = Event.find(params[:id])
  end

  def destroy
  	@event = Event.find(params[:id])
  	@event.destroy
  	redirect_to root_path
  end

  private
  def event_params
  	params.require(:event).permit(:title, :start_date, :duration, :description, :price, :location, :event_id, :event_picture )
  end
end
