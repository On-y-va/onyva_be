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
    if params[:trip][:city] != "" && params[:trip][:country] != "" && params[:trip][:postcode] != ""
      city_info = CityFacade.get_city_info(params[:trip][:city], params[:trip][:country], params[:trip][:postcode])
      @restaurants = CityFacade.get_restaurant_info(city_info.place_id)
      @place_id = city_info.place_id
      trip = Trip.create!(trip_params)
      @restaurants.each do |restaurant|
        TripEvent.create!(trip_id: trip.id, event_id: restaurant.place_id, name: restaurant.name, address: restaurant.address)
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
    params.require(:trip).permit(:name, :city, :country, :postcode, :start_date, :end_date).merge(place_id: @place_id, restaurants: @restaurants)
  end
end