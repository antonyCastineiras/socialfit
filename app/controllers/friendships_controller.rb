class FriendshipsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_friend_request_user, only: [:accept, :reject, :remove]

	def index
		user = User.find(params[:user_id])
		@friends = user.friends
	end

	def create
		requested_friend = User.where("email = '#{params[:email]}'").first
		if !requested_friend.nil?
		  current_user.friend_request(requested_friend)
		else
			flash[:notice] = "Could not find the friend you were looking for. Please check their email is spelled correctly."
		end
	end

	def accept
		current_user.accept_request(@friend_request_user)
	end

	def reject
		current_user.decline_request(@friend_request_user) 
	end

	def remove
		current_user.remove_friend(@friend_request_user)
	end

	private 

	def set_friend_request_user
		@friend_request_user = User.find(params[:id])
	end
end
