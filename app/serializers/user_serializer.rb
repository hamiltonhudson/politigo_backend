class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :score
  # has_many :events
  has_many :events, serializer: UserEventSerializer

  # before_save :default_score
  #
  # def default_score
  #   self.score ||= 0
  # end
end
