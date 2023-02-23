require 'rails_helper'

describe 'GET /users/:id/trips' do
  context 'when the users exist' do
    it 'sends a list of all their trips' do
      user = create(:user)

      trip_1 = create(:trip)
      trip_2 = create(:trip)
      trip_3 = create(:trip)
      trip_4 = create(:trip)
      
      trip_attendees_1 = create(:trip_attendee, user_id: user.id, trip_id: trip_1.id)
      trip_attendees_2 = create(:trip_attendee, user_id: user.id, trip_id: trip_2.id)
      trip_attendees_3 = create(:trip_attendee, user_id: user.id, trip_id: trip_3.id)
      trip_attendees_4 = create(:trip_attendee, user_id: user.id, trip_id: trip_4.id)

      get "/api/v1/users/#{user.id}/trips"

      user_trips_data = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(user_trips_data.count).to eq(4)

      expect(response).to be_successful

      user_trips_data.each do |trip|
        expect(trip).to have_key(:id)
        expect(trip[:id]).to be_a(String)
        
        expect(trip[:attributes]).to have_key(:name)
        expect(trip[:attributes][:name]).to be_a(String)
        
        expect(trip[:attributes]).to have_key(:city)
        expect(trip[:attributes][:city]).to be_a(String)
        
        expect(trip[:attributes]).to have_key(:country)
        expect(trip[:attributes][:country]).to be_a(String)
        
        expect(trip[:attributes]).to have_key(:postcode)
        expect(trip[:attributes][:postcode]).to be_a(String)
      end
    end
  end
end