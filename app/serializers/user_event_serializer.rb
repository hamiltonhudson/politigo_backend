class UserEventSerializer < ActiveModel::Serializer
  attributes :id, :cause, :style, :location, :date, :time
end
