class Api::V1::UsersController < ApplicationController
  def show
    # if params[:id] 
      render json: UserSerializer.new(User.find(params[:id]))
    # else 
    #   require 'pry'; binding.pry
    #   render json: ErrorSerializer.bad_request
    # end
  end

  def index
    render json: UserSerializer.new(User.all)
  end
end