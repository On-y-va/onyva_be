require 'rails_helper'

describe 'Trips create API' do
  describe 'POST /trips' do
    context 'when a trip is successfully created' do
      it 'can create a new trip' do
        expect(User.count).to eq(0)
        
        user = create(:user)
        expect(User.count).to eq(1)

        #TODO
        # expect{User}.to change{User.count}.by 1
        expect(Trip.count).to eq(0)
        trip_params_from_fe = {
          name: "Girl's Trip",
          city: "Denver",
          country: "United States",
          postcode: '80020',
          start_date: "11/08/25",
          end_date: "11/20/25",
          user_id: user.id
        }
        headers = { "CONTENT_TYPE" => "application/json" }
        
        post "/api/v1/trips", headers: headers, params: JSON.generate(trip: trip_params_from_fe)
        
        expect(Trip.count).to eq(1)
        new_trip = Trip.last

        expect(response).to be_successful
        expect(response.status).to eq(201)
        expect(new_trip.name).to eq(trip_params_from_fe[:name])
        expect(new_trip.city).to eq(trip_params_from_fe[:city])
        expect(new_trip.country).to eq(trip_params_from_fe[:country])
        expect(new_trip.postcode).to eq(trip_params_from_fe[:postcode])
      end
    end 

    context 'when a trip is not created' do
      it 'fails to create a trip when the name is left blank' do
        user = create(:user)

        trip_params = ({
                        name: "",
                        city: "Denver",
                        country: "United States",
                        postcode: '80020',
                        start_date: "11/08/25",
                        end_date: "11/30/25",
                        user_id: user.id
                      })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/trips", headers: headers, params: JSON.generate(trip: trip_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response.status).to be(400)
        expect(response_body[:error][0][:title]).to eq("Validation failed: Name can't be blank")
      end

      it 'fails to create a trip when the city is left blank' do
        user = create(:user)

        trip_params = ({
                        name: "Girl's Trip",
                        city: "",
                        country: "United States",
                        postcode: '80020',
                        start_date: "11/08/25",
                        end_date: "11/30/25",
                        user_id: user.id
                      })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/trips", headers: headers, params: JSON.generate(trip: trip_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response_body[:error][0][:title]).to eq("Validation failed: City can't be blank")
      end

      it 'fails to create a trip when the country is left blank' do
        user = create(:user)
        trip_params = ({
                        name: "Girl's Trip",
                        city: "Denver",
                        country: "",
                        postcode: '80020',
                        start_date: "11/08/25",
                        end_date: "11/30/25",
                        user_id: user.id  
                      })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/trips", headers: headers, params: JSON.generate(trip: trip_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response_body[:error][0][:title]).to eq("Validation failed: Country can't be blank")
      end

      it 'fails to create a trip when the postcode is left blank' do
        user = create(:user)

        trip_params = ({
                        name: "Girl's Trip",
                        city: 'Denver',
                        country: 'United States',
                        postcode: '',
                        start_date: "11/08/25",
                        end_date: "11/30/25",
                        user_id: user.id
                        })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/trips", headers: headers, params: JSON.generate(trip: trip_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response_body[:error][0][:title]).to eq("Validation failed: Postcode can't be blank")
      end

      it 'fails to create a trip when the start date is left blank' do
        user = create(:user)

        trip_params = ({
                        name: "Girl's Trip",
                        city: 'Denver',
                        country: 'United States',
                        postcode: '80020',
                        start_date: " ",
                        end_date: "12/12/23",
                        user_id: user.id
                       })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/trips", headers: headers, params: JSON.generate(trip: trip_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response.status).to be(400)
        expect(response_body[:error][0][:title]).to eq("Validation failed: Start date can't be blank")
      end

      it 'fails to create a trip when the end date is left blank' do
        user = create(:user)

        trip_params = ({
                        name: "Girl's Trip",
                        city: 'Denver',
                        country: 'United States',
                        postcode: '80020',
                        start_date: "11/30/25",
                        end_date: "",
                        user_id: user.id
                       })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/trips", headers: headers, params: JSON.generate(trip: trip_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response.status).to be(400)
        expect(response_body[:error][0][:title]).to eq("Validation failed: End date can't be blank")
      end
      
      it 'fails to create a trip when the end date is before the start date' do
        user = create(:user)

        trip_params = ({
                        name: "Girl's Trip",
                        city: 'Denver',
                        country: 'United States',
                        postcode: '80020',
                        start_date: "11/30/25",
                        end_date: "11/01/25",
                        user_id: user.id
                       })
        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/trips", headers: headers, params: JSON.generate(trip: trip_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response.status).to be(400)
        expect(response_body[:error][0][:title]).to eq("Validation failed: End date can't be blank")
      end
    end
  end
end