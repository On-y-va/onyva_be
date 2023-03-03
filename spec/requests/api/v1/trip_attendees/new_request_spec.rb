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

    context 'sad path' do
      xit 'returns an error if attendee doesnt exist' do
          patch "/api/v1/users/does_not_exist/trips/does_not_exist"
          body = JSON.parse(response.body, symbolize_names: true)
          
          expect(response).to_not be_successful
          expect(body[:error]).to be_a Array
          expect(body[:error].first[:status]).to eq("404")
          expect(body[:error].first[:title]).to eq("Couldn't find TripAttendee")
      end
    end
  end
end