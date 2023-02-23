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

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    render json: UserSerializer.new(user)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation)
  end
end