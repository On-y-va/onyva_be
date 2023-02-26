class TripSerializer
  include JSONAPI::Serializer
  attributes :name, :city, :country, :postcode, :place_id, :start_date, :end_date, :restaurants
  
  has_many :trip_events, serializer: TripEventSerializer
  # attribute :address, :name, :place_id
end