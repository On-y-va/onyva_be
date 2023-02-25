class Api::V1::UsersSearchController < ApplicationController
  def show
    user = User.find_user_by_email(params[:email])
    if user.nil?
      render json: ErrorSerializer.no_matches_found
    else
      render json: UserSerializer.new(user)
    end
  end
end