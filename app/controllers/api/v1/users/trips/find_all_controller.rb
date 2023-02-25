class Api::V1::Users::Trips::FindAllController < ApplicationController
  def show
    render json: UserSerializer.new(User.find(params[:id])) if params[:status] == "pending" || params[:status] == "accepted" || params[:status] == "declined" 
  end
end