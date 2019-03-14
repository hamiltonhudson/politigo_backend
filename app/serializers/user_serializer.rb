class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :score
  has_many :user_events, serializer: UserEventSerializer
  has_many :events, serializer: EventSerializer
end
