require 'rails_helper'

describe 'TripAttendee delete API' do
  describe 'DELETE /users/:user_id/trips/:trip_id' do
    context 'happy path' do
      it 'deletes a trip attendee' do
        user = create(:user)
        trip = create(:trip)
        trip_attendee = create(:trip_attendee, user_id: user.id, trip_id: trip.id)

        expect(trip_attendee.status).to eq("pending")
        delete "/api/v1/users/#{user.id}/trips/#{trip.id}"
        
        expect(response).to be_successful
        # delete_attendee = TripAttendee.find(trip_attendee.id)
        # expect(delete_attendee).to eq(nil)
        expect(TripAttendee.last).to_not eq(trip_attendee)
      end
    end

    context 'sad path' do
      it 'returns an error if attendee doesnt exist' do
          delete "/api/v1/users/does_not_exist/trips/does_not_exist"
          body = JSON.parse(response.body, symbolize_names: true)
          
          expect(response).to_not be_successful
          expect(body[:error]).to be_a Array
          expect(body[:error].first[:status]).to eq("404")
          expect(body[:error].first[:title]).to eq("Couldn't find TripAttendee")
      end
    end
  end
end