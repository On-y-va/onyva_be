class EventSerializer
  include JSONAPI::Serializer
  attributes :id, :trip_id, :event_date, :event_time, :event_id, :votes, :confirmed, :name, :address, :category

  belongs_to :trip, serializer: TripSerializer
end