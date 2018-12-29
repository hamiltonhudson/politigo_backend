class EventSerializer < ActiveModel::Serializer
  attributes :id, :cause, :location
  has_many :users
  # has_many :users, serializer: UserSerializer
end
