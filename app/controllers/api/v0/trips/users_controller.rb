class Api::V1::Trips::UsersController < ApplicationController
  def index
    render json: UserSerializer.new(Trip.find(params[:trip_id]).users)
  end
end