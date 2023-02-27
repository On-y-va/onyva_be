class TripSerializer
  include JSONAPI::Serializer
  attributes :name, :city, :country, :postcode, :place_id, :start_date, :end_date, :image_url
  
  has_many :trip_events, serializer: TripEventSerializer
end