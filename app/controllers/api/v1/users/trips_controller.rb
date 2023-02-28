class Api::V1::Users::TripsController < ApplicationController
  def update
    trip = User.find(params[:user_id]).trips.find(params[:id])
    trip.update!(user_trip_params)
    render json: TripSerializer.new(trip)
  end

  private

  def user_trip_params
    params.require(:trip).permit(:name, :city, :country, :postcode, :start_date, :end_date).merge(place_id: @place_id, image_url: @url)
  end
end