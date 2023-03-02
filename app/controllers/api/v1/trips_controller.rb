class Api::V1::TripsController < ApplicationController
include TripHelper
  def index
    render json: TripSerializer.new(Trip.all)
  end

  def show
    trip = Trip.find(params[:id])
    options = {include: [:events]}
    render json: TripSerializer.new(trip, options)
  end

  def create
    user = User.find(params[:trip][:user_id])
    trip = user.trips.create!(trip_params)
    location_info(trip)
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
    params.require(:trip).permit(
                                  :name, 
                                  :city, 
                                  :country, 
                                  :postcode, 
                                  :start_date, 
                                  :end_date)
  end

  def location_params
    params.require(:trip).permit(:city, :country, :postcode)
  end
end