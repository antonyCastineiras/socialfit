class MessagesController < ApplicationController
	def index
		@event = Event.find(params[:event_id])
		@messages = @event.messages
	end

  def create
  	@event = Event.find(params[:event_id])
  	params[:user_id].to_i == current_user.id ? @message = Message.new(message_params) : @message = Message.new
  	Notification.create(user: @event.user, content: "#{current_user.username} posted something on #{@event.name}'s message board") if @message.save && @event.user != current_user  
  end

  def update
    @message = Message.find(params[:id])
    @message.update(message_update_params) if @message.user == current_user
  end

  def get
  	@resource = params[:resource].constantize.find(params[:id])
   	@messages = @resource.messages.order(updated_at: :desc)[(params[:lowerLimit].to_i)..(params[:upperLimit].to_i)]
  end

  private

  def message_params
  	params.permit(:content,:event_id,:user_id)
  end

  def message_update_params
    params.require(:message).permit(:content)
  end
end
