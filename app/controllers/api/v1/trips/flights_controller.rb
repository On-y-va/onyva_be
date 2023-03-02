class Api::V1::Trips::FlightsController < ApplicationController
  def index
    render json: FlightSerializer.new(Trip.find(params[:trip_id]).flights)
  end

  def create
    user = User.find_user_by_email(params[:flight][:user_email])
    flight = Flight.create!({user_id: user.id, airline_code: params[:flight][:airline_code], flight_number: params[:flight][:flight_number], date: params[:flight][:date]})
    render json: FlightSerializer.new(flight), status: :created
  end
end