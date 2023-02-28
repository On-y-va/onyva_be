class EventsService
  def self.get_city(city, country, postcode)
    response = conn.get("/v1/geocode/search?text=#{city}&country#{country}&postcode=#{postcode}&lang=en&limit=1&type=city&apiKey=#{ENV['GEOAPIFY_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def self.get_restaurants(place_id)
    response = conn.get("/v2/places?categories=catering,catering.restaurant&filter=place:#{place_id}&lang=en&limit=10&apiKey=#{ENV['GEOAPIFY_KEY']}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_tourist_attractions(place_id)
    response = conn.get("/v2/places?categories=tourism&filter=place:#{place_id}&lang=en&limit=10&apiKey=#{ENV['GEOAPIFY_KEY']}")
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
