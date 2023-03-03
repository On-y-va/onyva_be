require 'rails_helper'

describe 'TripAttendee Create API' do
  describe 'POST /trips/:trip_id/trip_attendees' do
    context 'happy path' do
      it 'can create trip attendee to for a trip' do
        user1 = create(:user,id: 1, email: "a@gmail")
        user2 = create(:user,id: 2, email: "b@gmail")
        user3 = create(:user,id: 3, email: "c@gmail")

        user_emails = [user2.email, user3.email]

        trip = create(:trip, id: 1)

        trip_attendee = create(:trip_attendee, user_id: user1.id, trip_id: trip.id)

        expect(user1.trips).to eq([trip])
        expect(user2.trips).to eq([])
        expect(user3.trips).to eq([])
        
        headers = { "CONTENT_TYPE" => "application/json" }
        expect(TripAttendee.count).to eq(1)
        
        post "/api/v1/trips/#{trip.id}/trip_attendees", headers: headers, params: JSON.generate(user_emails: user_emails)
        expect(TripAttendee.count).to eq(3)

      end
    end
  end
end