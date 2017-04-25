class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :message, touch: true
end
