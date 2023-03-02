module TripHelper
  def location_info
    @place_id = CityFacade.get_city_info(*location_params.values)
    @url = FlickrFacade.get_city_image(params[:trip][:city], params[:trip][:country]).url
    create_events
  end

  def create_events
    CityFacade.get_restaurant_info(@place_id, @trip.id)
    CityFacade.get_tourist_attraction_info(@place_id, @trip.id)
  end
end