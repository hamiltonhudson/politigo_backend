class UserEventSerializer < ActiveModel::Serializer
  attributes :id, :cause, :style, :location, :lat, :long, :date, :time
end
