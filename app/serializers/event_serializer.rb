class EventSerializer < ActiveModel::Serializer
  attributes :id, :cause, :style, :location, :lat, :long, :date, :time, :users
  has_many :users, serializer: UserSerializer
end
