class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_friendship
  geocoded_by :postcode, if: ->(obj){ obj.postcode.present? and obj.postcode_changed? }
  after_validation :geocode #if: ->(obj){ obj.postcode.present? and obj.postcode_changed? }

  has_many :events
  has_many :invites
  has_many :notifications

  acts_as_taggable
  acts_as_taggable_on :interests, :sports

  mount_uploader :avatar, AvatarUploader

  def username=(s)
    write_attribute(:username, s.to_s.capitalize)
  end

  def sport_list=(string)
    sports = string.split(" ")
    sports.each { |sport| sport_list.add(sport) }
  end

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
    events = []
    sports.each { |sport| 
      tagged_events = Event.tagged_with(sport.name)
      tagged_events.each {|event| events << event}  
      }
  	events
  end

  def requested_calendar_events(requested_events, distance=nil)
    case requested_events
    when nil
      return all_calendar_events
    when 'nearby'
      return nearby_events(distance)
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

  def nearby_events(radius=50)
    Event.near([latitude,longitude], radius).where("open = true")
  end 

  def random_events
    100.times { |i|
      u = User.find(rand(User.count))
      u.events.create(name: "event #{i+1}", info: "here is some information about event #{i+1}", start_time: day_in_future, postcode: random_postcode, open: true)
    }
  end

  def day_in_future
    now = Time.now
    number_of_days = 14
    seconds_in_day = 60 * 60 * 24
    random_seconds = rand(number_of_days * seconds_in_day)
    (now + random_seconds).strftime("%d/%m/%Y %H:%M")
  end

  def random_postcode
    a = ('a'..'z').to_a
    l = a[rand(a.count)] 
    "#{a[rand(a.length)]}#{a[rand(a.length)]}#{rand(1..9)}#{rand(1..9)} #{rand(1..9)}#{a[rand(a.length)]}#{a[rand(a.length)]}"
  end
end
