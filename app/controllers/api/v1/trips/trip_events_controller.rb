class Api::V1::Trips::TripEventsController < ApplicationController
  def index
    trip = Trip.find(params[:trip_id])
    render json: TripEventSerializer.new(trip.trip_events)
    # render json: TripEventSerializer.new(TripEvent.find_by(trip_id: params[:trip_id]))
  end
end