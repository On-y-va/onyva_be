class CityFacade
  def self.get_city_info(city)
    city_info = TripEventsService.get_city(city)
    city_info[:features].map do |city|
      City.new(city)
    end
  end
end