class Api::V1::UsersController < ApplicationController
  def index
    render json: UserSerializer.new(User.all)
  end
  
  def show
    render json: UserSerializer.new(User.find(params[:id]))
  end

  def create
    user = User.create(user_params)
    if user.save
      render json: UserSerializer.new(User.create(user_params)), status: :created
    else
      # require 'pry'; binding.pry
    end
  end

  private 

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation)
  end
end