class EventsController < ApplicationController
	

	def new
	end

	def show
		@event = Event.find(params[:id])
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
		@event.destroy
		redirect_to user_home_path
	end

	def update_calendar
		@events = Event.all if params[:requested_events] == 'all'
		@events = current_user.events_of_friends if params[:requested_events] == 'friends' 	
	end

	private

	def new_event_params
		params.permit(:name,:info,:start_time,:postcode,:open,:requested_events)
	end
end
