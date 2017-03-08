class FriendshipsController < ApplicationController
	before_action :authenticate_user!

	def create
		requested_friend = User.where("email = '#{params[:email]}'").first
		if !requested_friend.nil?
		  current_user.friend_request(requested_friend)
		else
			flash[:notice] = "Could not find the friend you were looking for. Please check their email is spelled correctly."
		end
	end

	def accept
		@friend_request_user = User.find(params[:id])
		current_user.accept_request(@friend_request_user)
	end

	def reject
	end
end
