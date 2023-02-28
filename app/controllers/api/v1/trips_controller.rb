class Api::V1::TripsController < ApplicationController
  def index
    render json: TripSerializer.new(Trip.all)
  end

  def show
    trip = Trip.find(params[:id])
    options = {include: [:trip_events]} 
    render json: TripSerializer.new(trip, options)
  end
  
  def create
    if params[:trip][:city] != "" && params[:trip][:country] != "" && params[:trip][:postcode] != ""
      trip = Trip.create!(trip_params)
      render json: TripSerializer.new(trip), status: :created
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
    params.require(:trip).permit(:name, :city, :country, :postcode, :start_date, :end_date).merge(place_id: @place_id, image_url: @url)
  end
end