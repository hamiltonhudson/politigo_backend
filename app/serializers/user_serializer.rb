class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :events
  # has_many :events, serializer: EventSerializer
end
