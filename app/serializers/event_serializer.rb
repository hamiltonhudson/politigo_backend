class EventSerializer < ActiveModel::Serializer
  attributes :id, :cause, :style, :location, :date, :time
  # has_many :users
  has_many :users, serializer: UserSerializer
end
