class RepliesController < ApplicationController
  def create
  	@message = Message.find(params[:message_id])
  	@reply = @message.replies.new(user: current_user, content: params[:content])
  	Notification.new(user: @message.user, content: "#{current_user.username} replied to a message you posted on #{@message.event.name}") if @reply.save && @message.user != @reply.user
  end

  def index
  end
end
