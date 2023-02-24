class Api::V1::Trips::FlightsController < ApplicationController
  def index
    
    render json: FlightSerializer.new(Trip.find(params[:trip_id]).flights)
  end
end