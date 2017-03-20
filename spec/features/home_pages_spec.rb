require 'rails_helper'
require 'capybara/rails'

RSpec.feature "HomePages", type: :feature do
  describe "navigation" do
  	it "takes you to the root path" do
  		visit "/"
  		expect(current_path).to eq root_path
  	end
  end
end
