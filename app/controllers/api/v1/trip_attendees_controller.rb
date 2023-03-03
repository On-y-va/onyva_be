class Api::V1::TripAttendeesController < ApplicationController
  def create
    trip = Trip.find(params[:trip_id])
    users = User.find_users_by_email(params[:user_emails])
    users.each do |user|
      TripAttendee.create!(trip_id: trip.id, user_id: user.id)
    end
  end
end