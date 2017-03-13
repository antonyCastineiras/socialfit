class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def notify_friends(friends, content)
		friends.each do |friend|
			Notification.create(user: friend, content: content)
		end
	end
end
