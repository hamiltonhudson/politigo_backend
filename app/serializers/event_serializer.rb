class EventSerializer < ActiveModel::Serializer
  attributes :id, :cause, :location
end
