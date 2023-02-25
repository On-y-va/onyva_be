class TripSerializer
  include JSONAPI::Serializer
  attributes :name, :city, :country, :postcode, :place_id, :start_date, :end_date, :restaurants

  # has_many :restaurant
end