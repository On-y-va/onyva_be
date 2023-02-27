class Api::V1::TripsController < ApplicationController
  def index
    render json: TripSerializer.new(Trip.all)
  end

  def show
    trip = Trip.find(params[:id])
    render json: TripSerializer.new(Trip.find(params[:id]))
    # city = CityFacade.get_city_info(trip.city, trip.country, trip.postcode)
  end
  
  def create
    if location_params.keys.count == 3
      city_info = CityFacade.get_city_info(location_params.values)
      @restaurants = CityFacade.get_restaurant_info(city_info.place_id)
      @place_id = city_info.place_id
      trip = Trip.create!(trip_params)
      @restaurants.each do |restaurant|
        TripEvent.create!(trip_id: trip.id, 
                          event_id: restaurant.place_id, 
                          name: restaurant.name, 
                          address: restaurant.address)
      end
      render json: TripSerializer.new(trip), status: :created
      # options = {include: [:trip_events]} 
      # render json: TripSerializer.new(trip, options), status: :created
    else
      render json: ErrorSerializer.no_matches_found
    end
  end

  def update
    trip = Trip.find(params[:id])
    trip.update!(trip_params)
    render json: TripSerializer.new(trip)
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy!
  end

  private

  def trip_params
    params.require(:trip).permit(
                                 :name, 
                                 :city, 
                                 :country, 
                                 :postcode, 
                                 :start_date, 
                                 :end_date
                                 ).merge(
                                   place_id: @place_id,
                                   restaurants: @restaurants
                                  )
  end
  
  def location_params
    params.require(:trip).permit(:city, :country, :postcode)
  end
end