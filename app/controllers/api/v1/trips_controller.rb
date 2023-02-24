class Api::V1::TripsController < ApplicationController
  def index
    render json: TripSerializer.new(Trip.all)
  end

  def show
    render json: TripSerializer.new(Trip.find(params[:id]))
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