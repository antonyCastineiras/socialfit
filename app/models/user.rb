class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_friendship
  geocoded_by :postcode
  after_validation :geocode

  has_many :events
  has_many :invites

  def pending_invites
    invites.where("accepted = false")
  end

  def attending_events
    invites.where("accepted  = true").collect {|i| i.event }
  end

  def events_of_friends
  	all_friends = []
  	self.friends.each {|f|
  		f.events.where("open = true").each {|e| all_friends << e}
  	}
  	all_friends
  end

  def all_calendar_events
  	(self.events + events_of_friends + attending_events).uniq
  end

  def recommended_events
  	Event.where("open = true").sample(4)
  end

  def requested_calendar_events(requested_events)
    case requested_events
    when nil
      return all_calendar_events
    when 'all'
      return all_calendar_events
    when 'friends'
      return events_of_friends
    when 'own'
      return events
    when 'recommended'
      return recommended_events
    end
  end

  def nearby_events(radius=5)
    Event.near([latitude,longitude], radius)
  end 

end
