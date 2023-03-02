module TripHelper
  def location_info
    @city_info = CityFacade.get_city_info(*location_params.values)
    @place_id = @city_info.place_id
    image = FlickrFacade.get_city_image(params[:trip][:city], params[:trip][:country])
    @url = image.url
    create_events
  end

  def create_events
    events = CityFacade.get_restaurant_info(@city_info.place_id)
    make_event_object(events, 0)
    events = CityFacade.get_tourist_attraction_info(@city_info.place_id)
    make_event_object(events, 1)
  end
  
  def make_event_object(events, category)
    events.each do |event|
      Event.create!(trip_id: @trip.id, 
                    event_id: event.place_id, 
                    name: event.name, 
                    address: event.address, 
                    category: category)
    end
  end
end