class TripEventsService
  def self.get_city(city, country)
    response = conn.get("/v1/geocode/search?text=#{city}&country#{country}&lang=en&limit=10&type=city&apiKey=#{ENV['GEOAPIFY_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private 

  def self.conn
    Faraday.new(
      url: "https://api.geoapify.com",
      params: { apiKey: ENV['GEOAPIFY_KEY']}
    )
  end
end