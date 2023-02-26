require 'rails_helper'

describe 'Find all trips for a user API' do
  describe 'GET /users/:id/trips/find_all' do
    context 'if the user is found' do
      xit 'can return the users trip by status pending' do
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

        get "/api/v1/users/#{user.id}/trips/find_all", params: {status: trip_attendees_1.status}

        # require 'pry'; binding.pry
        user_trip_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful 

        expect(user_trip_response).to have_key(:data)
        expect(user_trip_response[:data]).to have_key(:id)
        expect(user_trip_response[:data]).to have_key(:attributes)

        data = user_trip_response[:data][:attributes]

        expect(data).to have_key(:first_name)
        expect(data[:first_name]).to be_a(String)
        
        expect(data).to have_key(:last_name)
        expect(data[:last_name]).to be_a(String)
        
        expect(data).to have_key(:phone_number)
        expect(data[:last_name]).to be_a(String)
        
        expect(data).to have_key(:email)
        expect(data[:last_name]).to be_a(String)
      end

      xit 'can return the users trip by status accepted' do
        user = create(:user)

        trip_1 = create(:trip)
        trip_2 = create(:trip)
        trip_3 = create(:trip)

        trip_attendees_1 = create(:trip_attendee, user_id: user.id, trip_id: trip_1.id, status: 0)
        trip_attendees_2 = create(:trip_attendee, user_id: user.id, trip_id: trip_2.id, status: 1)
        trip_attendees_3 = create(:trip_attendee, user_id: user.id, trip_id: trip_3.id, status: 2)

        get "/api/v1/users/#{user.id}/trips/find_all", params: {status: trip_attendees_2.status}

        user_trip_response = JSON.parse(response.body, symbolize_names: true)
 
        expect(response).to be_successful 
require 'pry'; binding.pry
        expect(user_trip_response).to have_key(:data)
        expect(user_trip_response[:data]).to have_key(:id)
        expect(user_trip_response[:data]).to have_key(:attributes)

        data = user_trip_response[:data][:attributes]

        expect(data).to have_key(:first_name)
        expect(data[:first_name]).to be_a(String)
        
        expect(data).to have_key(:last_name)
        expect(data[:last_name]).to be_a(String)
        
        expect(data).to have_key(:phone_number)
        expect(data[:last_name]).to be_a(String)
        
        expect(data).to have_key(:email)
        expect(data[:last_name]).to be_a(String)
      end

      xit 'can return the users trip by status declined' do
        user = create(:user)

        trip_1 = create(:trip)
        trip_2 = create(:trip)
        trip_3 = create(:trip)

        trip_attendees_1 = create(:trip_attendee, user_id: user.id, trip_id: trip_1.id, status: 0)
        trip_attendees_2 = create(:trip_attendee, user_id: user.id, trip_id: trip_2.id, status: 1)
        trip_attendees_3 = create(:trip_attendee, user_id: user.id, trip_id: trip_3.id, status: 2)

        get "/api/v1/users/#{user.id}/trips/find_all", params: {status: trip_attendees_3.status}

        user_trip_response = JSON.parse(response.body, symbolize_names: true)
 
        expect(response).to be_successful 

        expect(user_trip_response).to have_key(:data)
        expect(user_trip_response[:data]).to have_key(:id)
        expect(user_trip_response[:data]).to have_key(:attributes)

        data = user_trip_response[:data][:attributes]

        expect(data).to have_key(:first_name)
        expect(data[:first_name]).to be_a(String)
        
        expect(data).to have_key(:last_name)
        expect(data[:last_name]).to be_a(String)
        
        expect(data).to have_key(:phone_number)
        expect(data[:last_name]).to be_a(String)
        
        expect(data).to have_key(:email)
        expect(data[:last_name]).to be_a(String)
      end
    end

    context 'if the user is found' do
      xit 'can return the users trip by status pending' do
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
        expect(user_trip_response[:error]).to match(/Couldn't find User with 'id'=#{User.last.id+1}/)
      end
    end
  end
end