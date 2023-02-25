class FlightSerializer
  include JSONAPI::Serializer
  attributes :airline_code, :flight_number, :date
end