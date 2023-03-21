require 'rails_helper'

describe 'Flight API' do
  describe 'Get /trips/:trip_id/flights/:flight_id' do
    context 'if the flight exists' do
      it 'returns a flight' do
        flight = create(:flight)
        trip = create(:trip)

        get "/api/v1/trips/#{trip.id}/flights/#{flight.id}"

        flight_response = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(flight_response).to have_key(:data)
        expect(flight_response[:data]).to be_a(Hash)
        expect(flight_response[:data]).to have_key(:id)
        expect(flight_response[:data]).to have_key(:type)
        expect(flight_response[:data]).to have_key(:attributes)
        expect(flight_response[:data][:attributes]).to have_key(:date)
        expect(flight_response[:data][:attributes]).to have_key(:flight_number)
      end
    end 
  end
end