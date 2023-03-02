class CityFacade
  def self.get_city_info(city, country, postcode)
    city_info = EventsService.get_city(city, country, postcode)
    city = city_info[:features][0]
    City.new(city)
  end

  def self.get_restaurant_info(place_id, trip_id)
    restaurant_info = EventsService.get_restaurants(place_id)
    restaurant_info[:features].map do |restaurant|
      Event.create!(trip_id: trip_id,
                    event_id:  restaurant[:properties][:place_id],
                    name:  restaurant[:properties][:name],
                    address:  restaurant[:properties][:address_line2],
                    category: 0)
    end
  end

  def self.get_tourist_attraction_info(place_id, trip_id)
    tourist_attraction_info = EventsService.get_tourist_attractions(place_id)
    tourist_attraction_info[:features].map do |attraction|
      Event.create!(trip_id: trip_id,
                    event_id:  attraction[:properties][:place_id],
                    name:  attraction[:properties][:name],
                    address:  attraction[:properties][:address_line2],
                    category: 1)
    end
  end

  # def create_events(trip_id, events, category)
  #  .map do |attraction|
  #     Event.create!(trip_id: trip_id,
  #                   event_id:  attraction[:properties][:place_id],
  #                   name:  attraction[:properties][:name],
  #                   address:  attraction[:properties][:address_line2],
  #                   category: 1)
  #   end 
  # end
end