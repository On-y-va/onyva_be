require 'rails_helper'

describe 'Trip Flights Index API' do
  describe '/GET /flights/:id/trips' do
    it 'can get all flights' do
      t1 = create(:trip, start_date: Time.now, end_date: Time.now)

      u1 = create(:user)
      ta1 = create(:trip_attendee, user_id: u1.id, trip_id: t1.id)
      f1 = create(:flight, user_id: u1.id)

      u2 = create(:user)
      ta2 = create(:trip_attendee, user_id: u2.id, trip_id: t1.id)
      f2 = create(:flight, user_id: u2.id)

      u3 = create(:user)
      ta3 = create(:trip_attendee, user_id: u3.id, trip_id: t1.id)
      f3 = create(:flight, user_id: u3.id)

      get "/api/v1/trips/#{t1.id}/flights"

      flights_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(flights_response).to have_key(:data)

      flights_data = flights_response[:data]

      flights_data.each do |data|
        expect(data).to have_key(:id)
        expect(data[:id]).to be_a(String)

        attributes = data[:attributes]

        expect(attributes).to have_key(:airline_code)
        expect(attributes[:airline_code]).to be_a(String)

        expect(attributes).to have_key(:flight_number)
        expect(attributes[:flight_number]).to be_a(String)

        expect(attributes).to have_key(:date)
        expect(attributes[:date]).to be_a(String)
      end
    end
  end
end