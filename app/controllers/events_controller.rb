class EventsController < ApplicationController
	
	def index
		@events = current_user.requested_calendar_events(params[:requested_events])
	end

	def new
	end

	def show
		@event = Event.find(params[:id])
	end

	def create	
		event = Event.new(new_event_params)
		event.user = current_user
		if event.save
			Notification.create(user: current_user, content: "You created the event #{event.name}")
			notify_friends(current_user.friends, "#{current_user.username} created the event #{event.name}")
			redirect_to user_events_path
		else
			flash[:notice] = "unable to create event"
		end
	end

	def destroy
		@event = Event.find(params[:id])
		Notification.create(user: current_user, content: "You deleted the event #{@event.name}")
		notify_friends(@event.attending, "#{@event.organizer.username} cancelled the event that you were attending: #{@event.name}")
		@event.destroy
		redirect_to user_home_path
	end

	private

	def new_event_params
		params.permit(:name,:info,:start_time,:postcode,:open,:requested_events)
	end
end
