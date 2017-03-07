class EventsController < ApplicationController
	def new
	end

	def create	
		event = Event.new(new_event_params)
		event.user = current_user
		if event.save
			redirect_to user_home_path
		else
			flash[:error] = "unable to create event"
		end
	end

	private

	def new_event_params
		params.permit(:name,:info,:start_time)
	end
end
