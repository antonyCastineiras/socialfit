class NotificationsController < ApplicationController
  def index
  	@user = current_user
  	@notifications = @user.notifications
  end

  def get
  	@notifications = current_user.notifications.order('updated_at DESC')[params[:lowerLimit].to_i..params[:upperLimit].to_i]
  	render json: { notifications: @notifications }
  end
end
