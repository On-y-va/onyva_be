require 'rails_helper'

describe 'Flights create API' do
  describe 'POST /trips' do
    context 'when a flight is successfully created' do
      it 'can create a new flight' do
        user = create(:user)
        trip = create(:trip, start_date: Time.now, end_date: Time.now)

        flight_params = ({
          user_email: user.email,
          airline_code: "SW",
          flight_number: "1234",
          date: Date.today + 30.days
          })

        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/trips/#{trip.id}/flights", headers: headers, params: JSON.generate(flight: flight_params)

        new_flight = Flight.last

        expect(response).to be_successful
        expect(response.status).to eq(201)
        expect(new_flight.airline_code).to eq(flight_params[:airline_code])
        expect(new_flight.flight_number).to eq(flight_params[:flight_number])
        expect(new_flight.date).to eq(flight_params[:date])
      end
    end
  end
end