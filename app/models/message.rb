class Message < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :replies
end
