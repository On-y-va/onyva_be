class CityFacade
  def self.get_city_info(city, country)
    city_info = TripEventsService.get_city(city, country)
    city_info[:features].map do |city|
      City.new(city)
    end
  end
end