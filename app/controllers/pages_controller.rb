class PagesController < ApplicationController
  def index
  	@new_user = User.new
  end

  def home
  	@user = current_user
  	@events = @user.requested_calendar_events('all')
  end

  def get_page
  	@events = current_user.events
  	@page_name = params[:page]
  end
end
