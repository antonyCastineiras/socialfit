class PagesController < ApplicationController
  def index
  	@new_user = User.new
  end

  def home
    original_value = session[:current_page]
    set_page_name
    @user = current_user
    @events = @user.requested_calendar_events('all')
  end

  private

  def set_page_name
    session[:current_page] = params[:page] || session[:current_page] || 'feed'
    @page_name = session[:current_page]
  end
end


