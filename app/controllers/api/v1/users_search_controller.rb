class Api::V1::UsersSearchController < ApplicationController
  def show
    user = User.find_by(uid: params[:uid])
    if user.nil?
      render json: ErrorSerializer.no_matches_found
    else
      render json: UserSerializer.new(user)
    end
  end
end