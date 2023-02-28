require 'rails_helper'

describe 'TripAttndee Update API' do
  describe 'PATCH /users/:user_id/trips/:trip_id' do
    context 'happy path' do
      it 'can update a trip attendee to accepted' do
        user = create(:user)
        trip = create(:trip)
        trip_attendee = create(:trip_attendee, user_id: user.id, trip_id: trip.id)

        expect(trip_attendee.status).to eq("pending")
        patch "/api/v1/users/#{user.id}/trips/#{trip.id}"
        
        expect(response).to be_successful
        expect(TripAttendee.last.status).to eq("accepted")
      end
    end

    context 'sad path' do
      context 'returns and error if attendee doesnt exist' do
        it 'returns an error with invalid input ' do
          patch "/api/v1/users/does_not_exist/trips/does_not_exist"
          body = JSON.parse(response.body, symbolize_names: true)
          
          expect(response).to_not be_successful
          expect(body[:error]).to be_a Array
          expect(body[:error].first[:status]).to eq("404")
          expect(body[:error].first[:title]).to eq("Couldn't find TripAttendee")
          # expect(response_body[:error]).to match(/Couldn't find Trip with 'id'=#{Trip.last.id+1}/)
        end
      end
    end
  end
end