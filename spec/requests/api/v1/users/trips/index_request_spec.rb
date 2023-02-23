require 'rails_helper'

describe 'GET /users/:id/trips' do
  context 'when the users exist' do
    it 'sends a list of all their trips' do
      user = create(:user)

      trip_1 = create(:trip)
      trip_2 = create(:trip)
      trip_3 = create(:trip)
      trip_4 = create(:trip)
      
      user_trips = create(:trip_attendee, user_id: user.id, trip_id: trip_1.id)
      user_trips = create(:trip_attendee, user_id: user.id, trip_id: trip_2.id)
      user_trips = create(:trip_attendee, user_id: user.id, trip_id: trip_3.id)
      user_trips = create(:trip_attendee, user_id: user.id, trip_id: trip_4.id)

      visit "/api/v1/users/#{user.id}/trips"

      
    end
  end
end