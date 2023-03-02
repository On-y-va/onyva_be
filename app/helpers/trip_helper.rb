module TripHelper
  def location_info
    @city_info = CityFacade.get_city_info(*location_params.values)
    @place_id = @city_info.place_id
    image = FlickrFacade.get_city_image(params[:trip][:city], params[:trip][:country])
    @url = image.url
    create_events
  end

  def create_events
    restaurants = CityFacade.get_restaurant_info(@city_info.place_id)
    restaurants.each do |restaurant|
      Event.create!(trip_id: @trip.id, 
                    event_id: restaurant.place_id, 
                    name: restaurant.name, 
                    address: restaurant.address, 
                    category: 0)
    end

    attractions = CityFacade.get_tourist_attraction_info(@city_info.place_id)
    attractions.each do |attraction|
      Event.create!(trip_id: @trip.id, 
                    event_id: attraction.place_id, 
                    name: attraction.name, 
                    address: attraction.address, 
                    category: 1)
    end
  end
end