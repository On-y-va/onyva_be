require 'rails_helper'

describe 'TripUsers index API' do
  describe 'GET /trips/:trip_id/users' do
    context 'happy path' do
      it 'can get a trips users' do
        user1 = create(:user,id: 1, email: "a@gmail")
        user2 = create(:user,id: 2, email: "b@gmail")
        user3 = create(:user,id: 3, email: "c@gmail")

        trip = create(:trip, id: 1)

        trip_attendee = create(:trip_attendee, user_id: user1.id, trip_id: trip.id, status: 1)
        trip_attendee = create(:trip_attendee, user_id: user2.id, trip_id: trip.id, status: 1)
        trip_attendee = create(:trip_attendee, user_id: user3.id, trip_id: trip.id)

        expect(user1.trips).to eq([trip])
        expect(user2.trips).to eq([trip])
        expect(user3.trips).to eq([trip])
        
        headers = { "CONTENT_TYPE" => "application/json" }
        
        get "/api/v1/trips/#{trip.id}/users/find_all"
        
        trip_users = JSON.parse(response.body, symbolize_names: true)

        expect(trip_users).to have_key(:data)
        expect(trip_users[:data]).to be_a(Array)

        expect(trip_users[:data][0]).to have_key(:id)
        expect(trip_users[:data][0][:id]).to be_a(String)

        expect(trip_users[:data][0]).to have_key(:attributes)
        expect(trip_users[:data][0][:attributes]).to be_a(Hash)

        expect(trip_users[:data][0][:attributes]).to have_key(:first_name)
        expect(trip_users[:data][0][:attributes]).to have_key(:last_name)
        expect(trip_users[:data][0][:attributes]).to have_key(:phone_number)
        expect(trip_users[:data][0][:attributes]).to have_key(:email)
        expect(trip_users[:data][0][:attributes]).to have_key(:emergency_contact_name)
        expect(trip_users[:data][0][:attributes]).to have_key(:emergency_contact_phone_number)
        expect(trip_users[:data][0][:attributes]).to have_key(:google_uid)
      end
    end
  end
end