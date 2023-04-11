require 'rails_helper'

describe 'Flights create API' do
  describe 'DELETE /trips/:trip_id/flights/:flight_id' do
    context 'when a flight is successfully deleted' do
      it 'can delete a flight' do
        user = create(:user)
        trip = create(:trip, start_date: Time.now, end_date: Time.now)
        flight = create(:flight)

        expect(Flight.count).to eq(1)
        
        delete "/api/v1/trips/#{trip.id}/flights/#{flight.id}"
        
        expect(Flight.count).to eq(0)
        expect(response).to be_successful
        expect(response.status).to eq(200)

        flight_response = JSON.parse(response.body, symbolize_names: true)

        expect(flight_response).to have_key(:message)
        expect(flight_response[:message]).to be_a(String)
        expect(flight_response[:message]).to eq("Flight successfully deleted")
      end
    end
  end
end