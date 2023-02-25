class TripEventSerializer
  include JSONAPI::Serializer
  attributes :trip_id, :event_date, :event_time, :event_id, :votes, :confirmed
end
