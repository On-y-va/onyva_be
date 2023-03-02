module TripHelper
  def location_info(trip)
    place_id = CityFacade.get_city_info(*location_params.values)
    url = FlickrFacade.get_city_image(params[:trip][:city], params[:trip][:country])
    trip.update!(place_id: place_id, image_url: url)
    create_events(place_id, trip.id)
  end

  def create_events(place_id, trip_id)
    CityFacade.get_restaurant_info(place_id, trip_id)
    CityFacade.get_tourist_attraction_info(place_id, trip_id)
  end
end