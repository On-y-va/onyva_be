class AeroService
  def self.get_flight_status(flight_number)
    response = conn.get("/flights/number/#{flight_number}")
    JSON.parse(response.body, symbolize_names: true) unless response.body == ""
  end
 
  private 

  def self.conn
    Faraday.new(
      url: "https://aerodatabox.p.rapidapi.com",
      headers: {'X-RapidAPI-Key' => ENV['AERO_KEY'], 'X-RapidAPI-Host' => ENV['AERO_HOST']})
  end
end