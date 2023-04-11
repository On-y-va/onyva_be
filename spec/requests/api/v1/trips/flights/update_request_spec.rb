require 'rails_helper'

describe 'Flight update API' do
  describe 'PATCH /trips/:trip_id/flights/:flight_id' do
    context 'if the flight is successfully updated' do
      it 'updates the user' do
        flight = create(:flight)
        trip = create(:trip)
        previous_flight_number = flight.flight_number
        flight_params = { flight_number: "999" }
        headers = { "CONTENT_TYPE" => "application/json" }

        patch "/api/v1/trips/#{trip.id}/flights/#{flight.id}", headers: headers, params: JSON.generate({flight: flight_params})
        flight_response = JSON.parse(response.body, symbolize_names: true)
        flight = Flight.find_by(id: flight.id)

        expect(response).to be_successful
        expect(flight_response).to have_key(:message)
        expect(flight_response[:message]).to be_a(String)
        expect(flight_response[:message]).to eq("Flight successfully updated")

        expect(flight.flight_number).to eq("999")
        expect(flight.flight_number).to_not eq(previous_flight_number)
      end
    end 
  end
end