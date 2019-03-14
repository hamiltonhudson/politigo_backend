class UserEventSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :event_id
  has_one :user, serializer: UserSerializer
  has_one :event, serializer: EventSerializer
end
