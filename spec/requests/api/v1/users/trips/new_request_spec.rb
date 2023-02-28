require 'rails_helper' 

RSpec.describe 'User Trip Create' do
  describe 'POST /users/:id/trips' do
    context 'when a users trip is created' do
      it 'can create a trip for that user' do
        user = create(:user)
    
        user_trip_params = ({
                              name: "Girl's Trip",
                              city: "Denver",
                              country: "United States",
                              postcode: '80020',
                              start_date: "11/08/25",
                              end_date: "11/30/25"
                            })

        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/users/#{user.id}/trips", headers: headers, params: JSON.generate(trip: user_trip_params)

        new_trip = Trip.last

        expect(response).to be_successful
        expect(response.status).to eq(201)
        expect(new_trip.name).to eq(user_trip_params[:name])
        expect(new_trip.city).to eq(user_trip_params[:city])
        expect(new_trip.country).to eq(user_trip_params[:country])
        expect(new_trip.postcode).to eq(user_trip_params[:postcode])
      end
    end      

    context 'when a trip is not created' do
      it 'fails to create a trip when the name is left blank' do
        user = create(:user)
        user_trip_params = ({
                              name: "",
                              city: "Denver",
                              country: "United States",
                              postcode: '80020',
                              start_date: "11/08/25",
                              end_date: "11/30/25"
                            })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/users/#{user.id}/trips", headers: headers, params: JSON.generate(trip: user_trip_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response.status).to be(400)
        expect(response_body[:error]).to eq("Validation failed: Name can't be blank")
      end

      it 'fails to create a trip when the city is left blank' do
        user = create(:user)
        user_trip_params = ({
                              name: "Girl's Trip",
                              city: "",
                              country: "United States",
                              postcode: '80020',
                              start_date: "11/08/25",
                              end_date: "11/30/25"
                            })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/users/#{user.id}/trips", headers: headers, params: JSON.generate(trip: user_trip_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response_body[:data]).to eq({})
      end

      it 'fails to create a trip when the country is left blank' do
        user = create(:user)
        user_trip_params = ({
                              name: "Girl's Trip",
                              city: "Denver",
                              country: "",
                              postcode: '80020',
                              start_date: "11/08/25",
                              end_date: "11/30/25"
                            })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/users/#{user.id}/trips", headers: headers, params: JSON.generate(trip: user_trip_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response_body[:data]).to eq({})
      end

      it 'fails to create a trip when the postcode is left blank' do
        user = create(:user)
        user_trip_params = ({
                              name: "Girl's Trip",
                              city: 'Denver',
                              country: 'United States',
                              postcode: '',
                              start_date: "11/08/25",
                              end_date: "11/30/25"
                            })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/users/#{user.id}/trips", headers: headers, params: JSON.generate(trip: user_trip_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response_body[:data]).to eq({})
      end

      it 'fails to create a trip when the start date is left blank' do
        user = create(:user)
        user_trip_params = ({
                              name: "Girl's Trip",
                              city: 'Denver',
                              country: 'United States',
                              postcode: '80020',
                              start_date: " ",
                              end_date: "11/30/25"
                            })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/users/#{user.id}/trips", headers: headers, params: JSON.generate(trip: user_trip_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response.status).to be(400)
        expect(response_body[:error]).to eq("Validation failed: Start date can't be blank")
      end

      it 'fails to create a trip when the end date is left blank' do
        user = create(:user)
        user_trip_params = ({
                              name: "Girl's Trip",
                              city: 'Denver',
                              country: 'United States',
                              postcode: '80020',
                              start_date: "11/30/25",
                              end_date: ""
                              })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/users/#{user.id}/trips", headers: headers, params: JSON.generate(trip: user_trip_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response.status).to be(400)
        expect(response_body[:error]).to eq("Validation failed: End date can't be blank")
      end
    end
  end
end