class EventsController < ApplicationController
	before_action :set_event, only: [:show]

	def new
	end

	def show
	end

	def create	
		event = Event.new(new_event_params)
		event.user = current_user
		if event.save
			redirect_to user_home_path
		else
			flash[:notice] = "unable to create event"
		end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.delete
		redirect_to user_home_path
	end

	private

	def set_event
		@event = Event.find(params[:id])
	end

	def new_event_params
		params.permit(:name,:info,:start_time)
	end
end
