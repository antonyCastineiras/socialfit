class InvitesController < ApplicationController
	before_action :set_invite, only: [:accept, :reject]

	def create
		@invite = Invite.new
		@invite.event = Event.find(params[:event_id])
		@invite.user = User.find_by_email(params[:email])
		@invite.accepted = false
		if @invite.save
      Notification.create(user: @invite.user, content: "#{current_user.username} invited you to the group #{@invite.event.name}")
    else
			flash[:notice] = "Unable to invite"
		end
		redirect_to :back
	end

  def accept
  	@invite.accepted = true
  	@invite.save
  end

  def reject
  	@invite.accepted = false
  	@invite.save
  end

  private

  def set_invite
  	@invite = Invite.find(params[:id])
  end
end
