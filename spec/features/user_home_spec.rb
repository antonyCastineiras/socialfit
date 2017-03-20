require 'rails_helper'
require 'capybara/rails'
require './spec/helpers'

feature "user home page - " do
	before(:each) do
		create_user
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
			click_link("Schedule")
			page_container = find(:css, '#page-container')
			expect(page_container).to have_content("Schedule")
		end
	end

	describe "clicking friends link" do
		it "displays the correct page" do
			click_link("Friends")
			page_container = find(:css, '#page-container')
			expect(page_container).to have_content("Friends")
		end
	end

	describe "clicking events link" do
		it "displays the correct page" do
			click_link("Events")
			page_container = find(:css, '#page-container')
			expect(page_container).to have_content("Events")
		end
	end

	describe "clicking invites link" do
		it "displays the correct page" do
			click_link("Invites")
			page_container = find(:css, '#page-container')
			expect(page_container).to have_content("Invites")
		end
	end

	describe "clicking account settings link" do
		it "displays the correct page" do
			click_link("Account Settings")
			page_container = find(:css, '#page-container')
			expect(page_container).to have_content("Account Settings")
		end
	end
end