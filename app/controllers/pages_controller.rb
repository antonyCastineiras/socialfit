class PagesController < ApplicationController
  def index
  	@new_user = User.new
  end

  def home
  	set_page_name
  	@user = current_user
  	@events = @user.requested_calendar_events('all')
  end

  private

  def set_page_name
    original_value = session[:current_page]
  	session[:current_page] = params[:page] || session[:current_page] || 'feed'
  	@page_name = session[:current_page]
    session[:current_page] == original_value ? params[:page_updated] = false : params[:page_updated] = true
  end
end


