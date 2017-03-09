class Event < ApplicationRecord
  belongs_to :user
  has_many :invites, dependent: :destroy

  def organizer
  	user
  end

  def attending
  	invites.where("accepted = true").collect {|i| i.user }
  end
end
