module TripHelper
  def location_info
    @city_info = CityFacade.get_city_info(*location_params.values)
    @place_id = @city_info.place_id
    image = FlickrFacade.get_city_image(params[:trip][:city], params[:trip][:country])
    @url = image.url
    create_events
  end

  def create_events
    CityFacade.get_restaurant_info(@city_info.place_id, @trip.id)
    CityFacade.get_tourist_attraction_info(@city_info.place_id, @trip.id)
  end
end