require 'rails_helper'

describe 'Trips Index API' do
  describe '/GET /trips' do
    context 'when the trip exists' do
      it 'can get all trips' do
        create_list(:trip, 4)

        get '/api/v1/trips'

        trips_response = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful

        expect(trips_response).to have_key(:data)

        trips_data = trips_response[:data]

        trips_data.each do |data|
          expect(data).to have_key(:attributes)
          expect(data[:id]).to be_a(String)

          attributes = data[:attributes]

          expect(attributes).to have_key(:name)
          expect(attributes[:name]).to be_a(String)

          expect(attributes).to have_key(:city)
          expect(attributes[:city]).to be_a(String)

          expect(attributes).to have_key(:country)
          expect(attributes[:country]).to be_a(String)

          expect(attributes).to have_key(:postcode)
          expect(attributes[:postcode]).to be_a(String)
        end
      end
    end

    context 'when there are no trips in the database' do
      it 'returns an empty array' do
        get '/api/v1/trips'

        expect(response).to be_successful
        
        trips = JSON.parse(response.body, symbolize_names: true)

        expect(trips[:data]).to be_an(Array)
        expect(trips[:data].count).to eq(0)
        expect(trips[:data]).to eq([])
      end
    end
  end
end
