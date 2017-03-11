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
end
