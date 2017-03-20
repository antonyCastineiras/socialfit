require 'rails_helper'
require 'capybara/rails'
require './spec/helpers'

feature "events - " do
	before(:each) do
		create_user
		create_event("event one", "this is the first event", "03/03/2017,12:30", "ox26 3yp", true)
	end
	describe 'creating an event' do
		it 'creates an event in the database' do
			expect(Event.all.count).to eq 1
		end

		it 'redirects to a page that displays the event' do
			event = Event.first
			expect(current_path).to eq event_path(event)
		end 

		it 'titleizes the events name' do
			expect(page).to have_content("Event One")
		end
	end

	describe 'deleting an event' do
		it 'removes the event from the database' do
			click_link("Delete Event")
			expect(Event.all.count).to eq 0
		end
	end

	describe 'displaying events' do
		before(:each) do
			5.times { |i| create_event("event#{i}", "this is an event#{i}", "03/03/2017,12:30",  "ox26 3yp",  true)}
			visit user_home_path(page: 'events', page_update: true)
		end

		context 'when viewing your events' do
			it "displays only your events" do
				click_link("Display your events")
				expect(page).to have_selector(".event", count: 6)
			end
		end
	end
end