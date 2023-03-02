class Api::V1::Users::UserTripsController < ApplicationController
  def update
    invite = TripAttendee.find_by!(user_id: params[:user_id], trip_id: params[:id])
    invite.update!(status: "accepted")
  end

  def destroy
    invite = TripAttendee.find_by!(user_id: params[:user_id], trip_id: params[:id])
    invite.destroy!
  end
 end