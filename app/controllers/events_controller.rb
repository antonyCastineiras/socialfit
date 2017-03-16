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
			redirect_to event_path(event)
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

	def join
		@event = Event.find(params[:id])
		@invite = Invite.create(user: current_user, event: @event, accepted: true )
		Notification.create(user: current_user, content: "You signed up for #{@event.name}" )
		Notification.create(user: @event.organizer, content: "#{current_user.username} joined your event #{@event.name}")
	end

	def update_events
		@events = current_user.requested_calendar_events(params[:requested_events])
	end

	private

	def new_event_params
		params.permit(:name,:info,:start_time,:postcode,:open,:requested_events)
	end
end
