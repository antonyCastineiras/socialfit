require 'rails_helper'
require 'capybara/rails'
require './spec/helpers'

feature "sign up" do
  describe "signing up" do

  	context "providing correct details" do

	  	it "creates a user" do
	  		create_user("user@one.com", "user1", "password", "password")
	  		expect(User.all.count).to eq 1
	  	end

	  	it 'redirects you to the users home page' do
	  		create_user("user@one.com", "user1", "password", "password")
	  		expect(current_path).to eq user_home_path
	  	end
  	end

  	context "when passwords do not match" do
  		it "warns the user" do
  			create_user("user@one.com","user1","pasworf","password")
  			expect(page).to have_content "1 error prohibited this user from being saved"
  		end
  	end

  	context "when providing an email that is already taken" do
  		it "doesnt create a user" do
  			create_user("user@one.com","user1","password","password")
  			create_user("user@one.com","user2","password","password")
  			expect(User.all.count).to eq 1
  		end
  	end

  	context "when providing a username that is already taken" do
  		it "doesnt create a user" do
  			create_user("user@one.com","user1","password","password")
  			create_user("user@two.com","user1","password","password")
  			expect(User.all.count).to eq 1
  		end
  	end
  end
end