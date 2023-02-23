require 'rails_helper'

describe 'Trips Delete API' do
  describe 'DELETE /trips/:id' do
    context 'if a trip exists' do
      it 'can delete a trip' do
        user_1 = create(:user)
        user_2 = create(:user)
        user_3 = create(:user)
        user_4 = create(:user)
        user_5 = create(:user)

        trip_1 = create(:trip)
        trip_2 = create(:trip)
        
        trip_attendees_1 = create(:trip_attendee, user_id: user_1.id, trip_id: trip_1.id)
        trip_attendees_1 = create(:trip_attendee, user_id: user_2.id, trip_id: trip_1.id)
        trip_attendees_1 = create(:trip_attendee, user_id: user_3.id, trip_id: trip_1.id)
        trip_attendees_1 = create(:trip_attendee, user_id: user_4.id, trip_id: trip_2.id)
        trip_attendees_1 = create(:trip_attendee, user_id: user_5.id, trip_id: trip_2.id)
        trip_attendees_1 = create(:trip_attendee, user_id: user_1.id, trip_id: trip_2.id)
      
        expect(User.count).to eq(5)
        expect(Trip.count).to eq(2)
        expect(TripAttendee.count).to eq(6)

        delete "/api/v1/trips/#{trip_1.id}"

        expect(User.count).to eq(5)
        expect(Trip.count).to eq(1)
        expect(TripAttendee.count).to eq(3)
      end
    end
  end
end