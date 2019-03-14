class EventSerializer < ActiveModel::Serializer
  attributes :id, :cause, :style, :location, :lat, :long, :date, :time
  has_many :users, serializer: UserSerializer
end
