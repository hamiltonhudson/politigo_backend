class User < ApplicationRecord
  has_many :user_events
  has_many :events, through: :user_events

  # validates_associated :events, uniqueness: true
end
