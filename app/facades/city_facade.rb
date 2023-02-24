class CityFacade
  def self.get_city_info(city, country)
    city_info = TripEventsService.get_city(city, country)
    city = city_info[:features][0]
    City.new(city)
  end
end