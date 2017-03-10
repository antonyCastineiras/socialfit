class PagesController < ApplicationController
  def index
  	@new_user = User.new
  end

  def home
  	@user = current_user
  	@events = @user.events
  end
end
