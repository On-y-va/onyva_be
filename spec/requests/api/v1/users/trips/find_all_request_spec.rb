require 'rails_helper'

describe 'Find all trips for a user API' do
  describe 'GET /users/:id/trips/find_all' do
    context 'if the user is found' do
      it 'can return the users trip by status pending' do
        user = create(:user)

        trip_1 = create(:trip)
        trip_2 = create(:trip)
        trip_3 = create(:trip)
        trip_4 = create(:trip)

        trip_attendees_1 = create(:trip_attendee, user_id: user.id, trip_id: trip_1.id, status: 0)
        trip_attendees_2 = create(:trip_attendee, user_id: user.id, trip_id: trip_2.id, status: 0)
        trip_attendees_3 = create(:trip_attendee, user_id: user.id, trip_id: trip_3.id, status: 1)
        trip_attendees_4 = create(:trip_attendee, user_id: user.id, trip_id: trip_4.id, status: 1)
        trip_attendees_5 = create(:trip_attendee, user_id: user.id, trip_id: trip_4.id, status: 1)
        trip_attendees_6 = create(:trip_attendee, user_id: user.id, trip_id: trip_4.id, status: 2)

        get "/api/v1/users/#{user.id}/trips/find_all?status=0"

        user_trip_response = JSON.parse(response.body, symbolize_names: true)[:data]
        expect(response).to be_successful 

        expect(user_trip_response).to be_a(Array)
        expect(user_trip_response[0]).to have_key(:id)
        expect(user_trip_response[0]).to have_key(:type)
        expect(user_trip_response[0]).to have_key(:attributes)

        data = user_trip_response[0][:attributes]

        expect(data).to have_key(:name)
        expect(data[:name]).to be_a(String)
        
        expect(data).to have_key(:city)
        expect(data[:city]).to be_a(String)
        
        expect(data).to have_key(:country)
        expect(data[:country]).to be_a(String)
        
        expect(data).to have_key(:postcode)
        expect(data[:postcode]).to be_a(String)
      end

      it 'can return the users trip by status accepted' do
        user = create(:user)

        trip_1 = create(:trip)
        trip_2 = create(:trip)
        trip_3 = create(:trip)

        trip_attendees_1 = create(:trip_attendee, user_id: user.id, trip_id: trip_1.id, status: 0)
        trip_attendees_2 = create(:trip_attendee, user_id: user.id, trip_id: trip_2.id, status: 1)
        trip_attendees_3 = create(:trip_attendee, user_id: user.id, trip_id: trip_3.id, status: 2)

        get "/api/v1/users/#{user.id}/trips/find_all?status=1"

        user_trip_response = JSON.parse(response.body, symbolize_names: true)[:data]
 
        expect(response).to be_successful 

        expect(user_trip_response).to be_a(Array)
        expect(user_trip_response[0]).to have_key(:id)
        expect(user_trip_response[0]).to have_key(:type)
        expect(user_trip_response[0]).to have_key(:attributes)

        data = user_trip_response[0][:attributes]

        expect(data).to have_key(:name)
        expect(data[:name]).to be_a(String)
        
        expect(data).to have_key(:city)
        expect(data[:city]).to be_a(String)
        
        expect(data).to have_key(:country)
        expect(data[:country]).to be_a(String)
        
        expect(data).to have_key(:postcode)
        expect(data[:postcode]).to be_a(String)
      end

      it 'can return the users trip by status declined' do
        user = create(:user)

        trip_1 = create(:trip)
        trip_2 = create(:trip)
        trip_3 = create(:trip)

        trip_attendees_1 = create(:trip_attendee, user_id: user.id, trip_id: trip_1.id, status: 0)
        trip_attendees_2 = create(:trip_attendee, user_id: user.id, trip_id: trip_2.id, status: 1)
        trip_attendees_3 = create(:trip_attendee, user_id: user.id, trip_id: trip_3.id, status: 2)

        get "/api/v1/users/#{user.id}/trips/find_all?status=2"

        user_trip_response = JSON.parse(response.body, symbolize_names: true)[:data]
 
        expect(response).to be_successful 

        expect(user_trip_response).to be_a(Array)
        expect(user_trip_response[0]).to have_key(:id)
        expect(user_trip_response[0]).to have_key(:type)
        expect(user_trip_response[0]).to have_key(:attributes)

        data = user_trip_response[0][:attributes]

        expect(data).to have_key(:name)
        expect(data[:name]).to be_a(String)
        
        expect(data).to have_key(:city)
        expect(data[:city]).to be_a(String)
        
        expect(data).to have_key(:country)
        expect(data[:country]).to be_a(String)
        
        expect(data).to have_key(:postcode)
        expect(data[:postcode]).to be_a(String)
      end
    end

    context 'if the user is found' do
      it 'can return the users trip by status pending' do
        user = create(:user)

        trip_1 = create(:trip)
        trip_2 = create(:trip)
        trip_3 = create(:trip)
        trip_4 = create(:trip)

        trip_attendees_1 = create(:trip_attendee, user_id: user.id, trip_id: trip_1.id, status: 0)
        trip_attendees_2 = create(:trip_attendee, user_id: user.id, trip_id: trip_2.id, status: 0)
        trip_attendees_3 = create(:trip_attendee, user_id: user.id, trip_id: trip_3.id, status: 1)
        trip_attendees_4 = create(:trip_attendee, user_id: user.id, trip_id: trip_4.id, status: 1)
        trip_attendees_5 = create(:trip_attendee, user_id: user.id, trip_id: trip_4.id, status: 1)
        trip_attendees_6 = create(:trip_attendee, user_id: user.id, trip_id: trip_4.id, status: 2)

        get "/api/v1/users/#{User.last.id+1}/trips/find_all", params: {status: trip_attendees_1.status}

        user_trip_response = JSON.parse(response.body, symbolize_names: true)
 
        expect(response).to_not be_successful 
        expect(response.status).to eq(404)
        expect(user_trip_response).to have_key(:error)
        expect(user_trip_response[:error].first[:title]).to match(/Couldn't find User with 'id'=#{User.last.id+1}/)
      end
    end
  end
end