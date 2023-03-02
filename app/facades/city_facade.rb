class CityFacade
  def self.get_city_info(city, country, postcode)
    city_info = EventsService.get_city(city, country, postcode)
    city = city_info[:features][0]
    City.new(city)
  end

  def self.get_restaurant_info(place_id, trip_id)
    restaurants = EventsService.get_restaurants(place_id)[:features]
    CityFacade.create_events(trip_id, restaurants, 0)
  end
  
  def self.get_tourist_attraction_info(place_id, trip_id)
    attractions = EventsService.get_tourist_attractions(place_id)[:features]
    CityFacade.create_events(trip_id, attractions, 1)
  end

  def self.create_events(trip_id, events, category)
    events.map do |event|
      Event.create!(trip_id: trip_id,
                    event_id:  event[:properties][:place_id],
                    name:  event[:properties][:name],
                    address:  event[:properties][:address_line2],
                    category: category)
    end 
  end
end