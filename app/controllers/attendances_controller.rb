class AttendancesController < ApplicationController
before_action :redirect_if_not_admin, only: [:index]
	def create
		@event = Event.find(params[:event_id])
		@session = Stripe::Checkout::Session.create(
			payment_method_types: ['card'],
    	line_items: [{
      name: @event.title,
      amount: @event.price * 100,
      currency: 'eur',
      quantity: 1
        },],
    mode: 'payment',
    client_reference_id: current_user.email,
    success_url: event_success_url(@event.id) + '?session_id={CHECKOUT_SESSION_ID}',
    cancel_url: event_cancel_url(@event.id)
  )
	respond_to do |format|
		format.js
	end
	end

	def success
		@session = Stripe::Checkout::Session.retrieve(params[:session_id])
		if @session.payment_status == "paid"
			@user = User.find_by(email: @session.client_reference_id )
			@event = Event.find(params[:event_id])
			Attendance.create(user: current_user, event: @event)
		else
			redirect_to root
		end
	end

	def cancel

	end

	def index
		@event = Event.find(params[:event_id])
		@attendees = Attendance.where(event: @event)
	end
end
