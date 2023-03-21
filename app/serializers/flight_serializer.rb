class FlightSerializer
  include JSONAPI::Serializer
  attributes :flight_number, :date, :flight_user_name, :status

  def self.flight_deleted
    {
      message: "Flight successfully deleted"
    }
  end

  def self.flight_updated
    {
      message: "Flight successfully updated"
    }
  end
end