class User < ApplicationRecord
  has_many :user_events
  has_many :events, through: :user_events
  validates :name, uniqueness: false
  validates :email, uniqueness: true
  before_validation :capitalize_name
  validates_associated :events, uniqueness: true

  def increase_score
    self.score += 10
    self.save
  end

  def decrease_score
    self.score -= 10
    self.save
  end

  def capitalize_name
    capitalized_name = self.name.split(" ").map{|n| n.capitalize}.join(" ")
    self.name = capitalized_name
  end

end
