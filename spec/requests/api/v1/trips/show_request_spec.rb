require 'rails_helper'

describe 'Trips show API' do
  describe 'GET /trips/:id' do
    context 'when the trip exists' do
      it 'can get one trip by their id' do
        trip = create(:trip)

        get "/api/v1/trips/#{trip.id}"

        trip_response = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful

        expect(trip_response).to have_key(:data)
        expect(trip_response[:data]).to have_key(:attributes)
        expect(trip_response[:data][:id]).to be_a(String)

        trip_data = trip_response[:data][:attributes]

        expect(trip_data).to have_key(:name)
        expect(trip_data[:name]).to be_a(String)

        expect(trip_data).to have_key(:city)
        expect(trip_data[:city]).to be_a(String)

        expect(trip_data).to have_key(:country)
        expect(trip_data[:country]).to be_a(String)

        expect(trip_data).to have_key(:postcode)
        expect(trip_data[:postcode]).to be_a(String)
      end
    end

    context 'when the trip does not exist' do
      it 'responds with an error' do
        trip = create(:trip)

        get "/api/v1/trips/#{Trip.last.id+1}"

        expect(response).to_not be_successful

        trip = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(404)
        expect(trip).to have_key(:error)

        expect(trip[:error]).to match(/Couldn't find Trip with 'id'=#{Trip.last.id+1}/)
      end
    end
  end
end