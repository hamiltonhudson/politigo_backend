class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :location, :date, :time
end
