class Event < ApplicationRecord
  belongs_to :user

  def organizer
  	user
  end
end
