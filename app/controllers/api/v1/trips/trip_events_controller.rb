class Api::V1::Trips::TripEventsController < ApplicationController
  def index
    render json: TripEventSerializer.new(TripEvent.find_by(trip_id: params[:trip_id]))
  end
end