require 'rails_helper'
require 'capybara/rails'
require './spec/helpers'

feature "user home page - " do
	before(:each) do
		create_user("user@one.com","user1","password","password")
	end

	describe "clicking your feed link" do
		it "displays the correct page" do
			click_link("Your feed")
			page_container = find(:css, '#page-container')
			expect(page_container).to have_content("Feed")
		end
	end

	describe "clicking schedule link" do
		it "displays the correct page" do
			# click_link("Schedule")
			page_container = find(:css, '#page-container')
			expect(page_container).to have_content("Schedule")
		end
	end
end