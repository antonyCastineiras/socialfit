class PagesController < ApplicationController
  def index
  	@new_user = User.new
  end

  def home
  	@user = current_user
  	@events = @user.all_calendar_events
  end
end
