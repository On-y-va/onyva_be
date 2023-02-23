class Api::V1::TripsController < ApplicationController
  def show
    render json: TripSerializer.new(Trip.find(params[:id]))
  end
end