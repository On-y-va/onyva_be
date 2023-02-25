class CityFacade
  def self.get_city_info(city, country, postcode)
    city_info = TripEventsService.get_city(city, country, postcode)
    city = city_info[:features][0]
    City.new(city)
  end

  def self.get_restaurant_info(place_id)
    restaurant_info = TripEventsService.get_restaurants(place_id)
    restaurant_info[:features].map do |restaurant|
      Restaurant.new(restaurant)
    end
  end
end