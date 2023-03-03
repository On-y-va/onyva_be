require 'rails_helper'

describe 'Users update API' do
  describe 'PATCH /trips/:id' do
    context 'if the trip is successfully updated' do
      it 'updates the trip' do
        trip = create(:trip, start_date: Time.now, end_date: Time.now)
        previous_trip_name = Trip.last.name
        trip_params = { name: "Updated Trip" }
        headers = { "CONTENT_TYPE" => "application/json" }

        patch "/api/v1/trips/#{trip.id}", headers: headers, params: JSON.generate({trip: trip_params})
        response_body = JSON.parse(response.body, symbolize_names: true)
        trip = Trip.find_by(id: trip.id)

        expect(response).to be_successful
        expect(trip.name).to eq("Updated Trip")
        expect(trip.name).to_not eq(previous_trip_name)
      end
    end

    context 'if the trip is not updated successfully' do
      it 'fails if to update if trip name is left blank' do
        trip = create(:trip, name: 'Updated Trip', start_date: Time.now, end_date: Time.now)
        previous_trip_name = Trip.last.name
        trip_params = { name: "" }
        headers = { "CONTENT_TYPE" => "application/json" }
        
        patch "/api/v1/trips/#{trip.id}", headers: headers, params: JSON.generate({trip: trip_params})
        response_body = JSON.parse(response.body, symbolize_names: true)
        trip = Trip.find_by(id: trip.id)
        
        expect(response).to_not be_successful
        expect(response.status).to eq(400)
        expect(trip.name).to eq(previous_trip_name)
        expect(trip.name).to eq("Updated Trip")

        expect(response_body[:error].first[:title]).to match("Validation failed: Name can't be blank")
      end
    end
  end
end