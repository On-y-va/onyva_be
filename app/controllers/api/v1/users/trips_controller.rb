class Api::V1::Users::TripsController < ApplicationController
  def index
    render json: TripSerializer.new(User.find(params[:user_id]).trips)
  end
end