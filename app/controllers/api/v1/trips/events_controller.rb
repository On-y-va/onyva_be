class Api::V1::Trips::EventsController < ApplicationController
  def update
    event = Event.find(params[:id])
    event.add_vote
    event.save
    render json: {message: "Vote successfully added"}
  end

  def show
    trip = Trip.find(params[:trip_id])
    event = trip.most_popular_event
    render json: EventSerializer.new(event)
  end
end