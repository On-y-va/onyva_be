class Api::V1::UsersSearchController < ApplicationController
  def show
    user = User.find_by(google_uid: params[:google_uid])
    if user.nil?
      render json: ErrorSerializer.no_matches_found
    else
      render json: UserSerializer.new(user)
    end
  end
end