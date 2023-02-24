class TripEventsService
  def self.get_city(city, country)
    response = conn.get("/v1/geocode/search?text=#{city}&country#{country}&lang=en&limit=10&type=city&apiKey=#{ENV['GEOAPIFY_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def self.get_restaurants(place_id)
    # response = conn.get("v2/places?categories=catering,catering.restaurant&filter=circle:2.1774322,41.3828939,5000&bias=proximity:2.1774322,41.3828939&lang=en&limit=15&apiKey=#{ENV['GEOAPIFY_KEY']}")
    response = conn.get("/v2/places?categories=catering,catering.restaurant&filter=place:#{place_id}&lang=en&limit=15&apiKey=#{ENV['GEOAPIFY_KEY']}")
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
