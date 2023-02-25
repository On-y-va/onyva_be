class Api::V1::TripsController < ApplicationController
  def index
    render json: TripSerializer.new(Trip.all)
  end

  def show
    trip = Trip.find(params[:id])
    render json: TripSerializer.new(Trip.find(params[:id]))
    # city = CityFacade.get_city_info(trip.city, trip.country, trip.postcode)
    # erase vcr
    # restaurants = CityFacade.get_restaurant(city.place_id)
  end

  def create
    trip = Trip.create!(trip_params)
    render json: TripSerializer.new(trip), status: :created
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
    params.require(:trip).permit(:name, :city, :country, :postcode, :place_id, :start_date, :end_date)
  end
end