class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_friendship

  has_many :events
  has_many :invites, -> { where "accepted = false"}

  has_many :attending_events, -> { where "accepted = true"}, through: :invites, source: :event

  def events_of_friends
  	all_friends = []
  	self.friends.each {|f|
  		f.events.where("open = true").each {|e| all_friends << e}
  	}
  	all_friends
  end

end
