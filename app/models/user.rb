class User < ApplicationRecord
  has_many :user_events
  has_many :events, through: :user_events
  validates :name, uniqueness: true
  validates_associated :events, uniqueness: true

  def increase_score
    self.score += 10
    self.save
  end

  def decrease_score
    self.score -= 10
    self.save
  end

end
