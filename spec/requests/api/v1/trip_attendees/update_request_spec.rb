require 'rails_helper'

describe 'TripAttendee Update API' do
  describe 'PATCH /users/:user_id/trips/:trip_id' do
    context 'happy path' do
      it 'can update a trip attendee to accepted' do
        user = create(:user)
        trip = create(:trip, start_date: Time.now, end_date: Time.now)
        trip_attendee = create(:trip_attendee, user_id: user.id, trip_id: trip.id)

        expect(trip_attendee.status).to eq("pending")
        patch "/api/v1/users/#{user.id}/trips/#{trip.id}"
        
        expect(response).to be_successful

        expect(TripAttendee.last.status).to eq("accepted")
      end
    end

    context 'sad path' do
      it 'returns an error if attendee doesnt exist' do
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