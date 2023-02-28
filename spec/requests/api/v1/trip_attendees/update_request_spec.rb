require 'rails_helper'

describe 'TripAttndee Update API' do
  describe 'PATCH /users/:user_id/trips/:trip_id' do
    context 'if a user & trip exists' do
      xit 'can update a trip attendee' do
        user = create(:user)
        trip = create(:trip)
        trip_attendee = create(:trip_attendee, user_id: user.id, trip_id: trip.id)

        expect(trip_attendee.status).to eq("pending")
        patch "/api/v1/users/#{user.id}/trips/#{trip.id}"
        
        expect(response).to be_successful
        expect(trip_attendee.status).to eq("accepted")
      end
    end

      xit 'can update a trip attendee' do

        trip_attendees_1 = create(:trip_attendee)

        expect(User.count).to eq(5)
        expect(Trip.count).to eq(2)
        expect(TripAttendee.count).to eq(6)

        delete "/api/v1/users/#{trip_attendees_1.user_id}/trips/#{trip_attendees_1.trip.id}"

        expect(response).to be_successful
      end

    context 'if the trip does not exist' do
      xit 'sends an error message' do
        trip = create(:trip)

        delete "/api/v1/trips/#{Trip.last.id+1}"
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response.status).to eq(404)
        expect(response_body[:error]).to match(/Couldn't find Trip with 'id'=#{Trip.last.id+1}/)
        expect(Trip.count).to eq(1)
      end
    end
  end
end