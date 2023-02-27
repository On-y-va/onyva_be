require 'rails_helper'

describe 'Trips create API' do
  describe 'POST /trips' do
    context 'when a trip is successfully created' do
      it 'can create a new trip' do
        trip_params = ({
                        name: "Girl's Trip",
                        city: "Denver",
                        country: "United States",
                        postcode: '80020',
                        start_date: "11/08/25",
                        end_date: "11/30/25"
                      })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/trips", headers: headers, params: JSON.generate(trip: trip_params)

        new_trip = Trip.last

        expect(response).to be_successful
        expect(response.status).to eq(201)
        expect(new_trip.name).to eq(trip_params[:name])
        expect(new_trip.city).to eq(trip_params[:city])
        expect(new_trip.country).to eq(trip_params[:country])
        expect(new_trip.postcode).to eq(trip_params[:postcode])
      end
    end 

    context 'when a trip is not created' do
      it 'fails to create a trip when the name is left blank' do
        trip_params = ({
                        name: "",
                        city: "Denver",
                        country: "United States",
                        postcode: '80020',
                        start_date: "11/08/25",
                        end_date: "11/30/25"
                      })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/trips", headers: headers, params: JSON.generate(trip: trip_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response.status).to be(400)
        expect(response_body[:error]).to eq("Validation failed: Name can't be blank")
      end

      it 'fails to create a trip when the city is left blank' do
        trip_params = ({
                        name: "Girl's Trip",
                        city: "",
                        country: "United States",
                        postcode: '80020',
                        start_date: "11/08/25",
                        end_date: "11/30/25"
                      })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/trips", headers: headers, params: JSON.generate(trip: trip_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response_body[:data]).to eq({})
        # expect(response_body[:error]).to eq("Validation failed: City can't be blank")
      end

      it 'fails to create a trip when the country is left blank' do
        trip_params = ({
                        name: "Girl's Trip",
                        city: "Denver",
                        country: "",
                        postcode: '80020',
                        start_date: "11/08/25",
                        end_date: "11/30/25"
                      })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/trips", headers: headers, params: JSON.generate(trip: trip_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response_body[:data]).to eq({})
        # expect(response_body[:error]).to eq("Validation failed: Country can't be blank")
      end

      it 'fails to create a trip when the postcode is left blank' do
        trip_params = ({
                        name: "Girl's Trip",
                        city: 'Denver',
                        country: 'United States',
                        postcode: '',
                        start_date: "11/08/25",
                        end_date: "11/30/25"
                        })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/trips", headers: headers, params: JSON.generate(trip: trip_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response_body[:data]).to eq({})
        # expect(response_body[:error]).to eq("Validation failed: Postcode can't be blank")
      end

      it 'fails to create a trip when the start date is left blank' do
        trip_params = ({
                        name: "Girl's Trip",
                        city: 'Denver',
                        country: 'United States',
                        postcode: '80020',
                        start_date: " ",
                        end_date: "11/30/25"
                       })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/trips", headers: headers, params: JSON.generate(trip: trip_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response.status).to be(400)
        # expect(response_body[:error]).to eq("Validation failed: Start date can't be blank")
      end

      it 'fails to create a trip when the end date is left blank' do
        trip_params = ({
                        name: "Girl's Trip",
                        city: 'Denver',
                        country: 'United States',
                        postcode: '80020',
                        start_date: "11/30/25",
                        end_date: ""
                       })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/trips", headers: headers, params: JSON.generate(trip: trip_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response.status).to be(400)
        # expect(response_body[:error]).to eq("Validation failed: End date can't be blank")
      end
    end
  end
end