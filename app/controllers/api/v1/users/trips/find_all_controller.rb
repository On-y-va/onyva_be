class Api::V1::Users::Trips::FindAllController < ApplicationController
  def index
    user = User.find(params[:id])
    if params[:status] == '0' || params[:status] == '1' || params[:status] == '2'
      trips = user.find_user_trip_by_status(params[:status])    
      render json: TripSerializer.new(trips)
    end
  end
end