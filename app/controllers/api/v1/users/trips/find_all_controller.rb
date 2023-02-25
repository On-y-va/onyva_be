class Api::V1::Users::Trips::FindAllController < ApplicationController
  def show
    user = User.find(params[:id])
    if params[:status] == "pending" 
      trips = user.find_user_trip_by_status(params[:status])    
      # require 'pry'; binding.pry
      render json: TripSerializer.new(trips)
    else 
    # || params[:status] == "accepted" || params[:status] == "declined" 
    end

  end
end