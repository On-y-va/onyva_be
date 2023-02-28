require 'rails_helper'

describe 'Users Index API' do
  describe '/GET /users' do
    context 'when the user exists' do
      it 'can get all users' do
        trip = create(:trip)
        create_list(:user, 4)
        ta1 = create(:trip_attendee, user_id: User.first.id, trip_id: trip.id)
        ta2 = create(:trip_attendee, user_id: User.last.id, trip_id: trip.id)

        get "/api/v1/trips/#{trip.id}/users"

        users_response = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful

        expect(users_response).to have_key(:data)

        users_data = users_response[:data]

        users_data.each do |data|
          expect(data).to have_key(:attributes)
          expect(data[:id]).to be_a(String)

          attributes = data[:attributes]

          expect(attributes).to have_key(:first_name)
          expect(attributes[:first_name]).to be_a(String)

          expect(attributes).to have_key(:last_name)
          expect(attributes[:last_name]).to be_a(String)

          expect(attributes).to have_key(:email)
          expect(attributes[:email]).to be_a(String)

          expect(attributes).to have_key(:phone_number)
          expect(attributes[:phone_number]).to be_a(String)

          expect(attributes).to have_key(:emergency_contact_name)
          expect(attributes[:emergency_contact_name]).to be_nil

          expect(attributes).to have_key(:emergency_contact_phone_number)
          expect(attributes[:emergency_contact_phone_number]).to be_nil
        end
      end
    end

    context 'when there are no users in the database' do
      it 'returns an empty array' do
        trip = create(:trip)
        get "/api/v1/trips/#{trip.id}/users"
        expect(response).to be_successful
        users = JSON.parse(response.body, symbolize_names: true)
        expect(users[:data]).to be_an(Array)
        expect(users[:data].count).to eq(0)
        expect(users[:data]).to eq([])
      end
    end
  end
end
