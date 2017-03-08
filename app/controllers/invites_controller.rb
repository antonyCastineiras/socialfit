class InvitesController < ApplicationController
	before_action :set_invite, only: [:accept, :reject]

	def create
		@invite = Invite.new
		@invite.event = Event.find(params[:event_id])
		@invite.user = User.find_by_email(params[:email])
		@invite.accepted = false
		if !@invite.save
			flash[:notice] = "Unable to invite"
		end
		redirect_to :back
	end

  def accept
  	@invite.accepted = true
  	@invite.save
  	redirect_to :back
  end

  def reject
  	@invite.accepted = false
  	@invite.save
  	redirect_to :back
  end

  private

  def set_invite
  	@invite = Invite.find(params[:id])
  end
end