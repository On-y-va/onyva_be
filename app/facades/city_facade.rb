class CityFacade
  def self.get_city_info(location_params)
    city_info = TripEventsService.get_city(*location_params)
    city = city_info[:features][0]
    City.new(city)
  end

  def self.get_restaurant_info(place_id)
    restaurant_info = TripEventsService.get_restaurants(place_id)
    restaurant_info[:features].map do |restaurant|
      Restaurant.new(restaurant)
    end
  end

  def self.get_tourist_attraction_info(place_id)
    tourist_attraction_info = TripEventsService.get_tourist_attractions(place_id)
    tourist_attraction_info[:features].map do |attraction|
      TouristAttraction.new(attraction)
    end
  end
end