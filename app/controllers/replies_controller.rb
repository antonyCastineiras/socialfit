class RepliesController < ApplicationController
  def create
  	@message = Message.find(params[:message_id])
  	@reply = @message.replies.new(user: current_user, content: params[:content])
  	Notification.new(user: @message.user, content: "#{current_user.username} replied to a message you posted on #{@message.event.name}") if @reply.save && @message.user != @reply.user
  end

  def index
  	@message = Message.find(params[:message_id])
  end

  def update
  end

  def get
  	@message = Message.find(params[:id])
  	@replies = @message.replies.order(updated_at: :desc)[params[:lowerLimit].to_i..params[:upperLimit].to_i]
  end
end
