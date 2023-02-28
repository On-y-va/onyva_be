class Api::V1::Trips::EventsController < ApplicationController
  def index
    trip = Trip.find(params[:trip_id])
    render json: EventSerializer.new(trip.events)
    # render json: Eventserializer.new(TripEvent.find_by(trip_id: params[:trip_id]))
  end
end