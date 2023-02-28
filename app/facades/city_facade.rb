class CityFacade
  def self.get_city_info(city, country, postcode)
    city_info = EventsService.get_city(city, country, postcode)
    city = city_info[:features][0]
    City.new(city)
  end

  def self.get_restaurant_info(place_id)
    restaurant_info = EventsService.get_restaurants(place_id)
    restaurant_info[:features].map do |restaurant|
      Restaurant.new(restaurant)
    end
  end

  def self.get_tourist_attraction_info(place_id)
    tourist_attraction_info = EventsService.get_tourist_attractions(place_id)
    tourist_attraction_info[:features].map do |attraction|
      TouristAttraction.new(attraction)
    end
  end
end