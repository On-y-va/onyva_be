class AeroFacade
  def self.get_flight_status(flight_number)
    result = AeroService.get_flight_status(flight_number)
    result[0][:status] unless result.nil?
  end
end