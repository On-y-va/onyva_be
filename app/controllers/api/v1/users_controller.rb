class Api::V1::UsersController < ApplicationController
  def index
    render json: UserSerializer.new(User.all)
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    render json: UserSerializer.new(user)
  end

  def show
    render json: UserSerializer.new(User.find(params[:id]))
  end

  def create
    user = User.create!(user_params)
    render json: UserSerializer.new(user), status: :created
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation)
  end
end