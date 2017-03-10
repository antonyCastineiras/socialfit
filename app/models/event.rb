class Event < ApplicationRecord
  belongs_to :user
  has_many :invites, dependent: :destroy

  def organizer
  	user
  end

  def attending
  	invites.where("accepted = true").collect {|i| i.user }
  end

  def open_to_s
  	open ? 'open' : 'closed'
  end

  def self.requested_calendar_events(requested_events,user)
  	case requested_events
  	when 'all'
  		return user.all_calendar_events
  	when 'friends'
  		return user.events_of_friends
  	when 'own'
  		return user.events
  	when 'recommended'
  		return user.recommended_events
  	end
  end	
end
