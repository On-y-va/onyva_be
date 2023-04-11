class Api::V1::Trips::FlightsController < ApplicationController
  def index
    render json: FlightSerializer.new(Trip.find(params[:trip_id]).flights)
  end

  def show
    flight = Flight.find(params[:id])
    render json: FlightSerializer.new(flight)
  end

  def create
    @user = User.find_by(email: params[:flight][:user_email])
    if @user.nil?
      render json: UserSerializer.no_matches_found
    else
      @flight_status = AeroFacade.get_flight_status(params[:flight][:flight_number])
      flight = Flight.create!(flight_params)
      render json: FlightSerializer.new(flight), status: :created
    end
  end

  def destroy
    flight = Flight.find(params[:id])
    flight.destroy!
    render json: FlightSerializer.flight_deleted
  end

  def update
    @updated_flight_status = AeroFacade.get_flight_status(params[:flight][:flight_number])
    flight = Flight.find(params[:id])
    flight.update(flight_update_params)
    render json: FlightSerializer.flight_updated
  end

  private

  def flight_params
    params.require(:flight).permit(:date, :flight_number).merge(user_id: @user.id, status: @flight_status)
  end

  def flight_update_params
    params.require(:flight).permit(:date, :flight_number).merge(status: @updated_flight_status)
  end
end