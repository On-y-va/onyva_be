class Api::V1::Trips::UsersController < ApplicationController
  def index
    trip = Trip.find(params[:trip_id])
    users = trip.users_going
    render json: UserSerializer.new(users)
  end
end