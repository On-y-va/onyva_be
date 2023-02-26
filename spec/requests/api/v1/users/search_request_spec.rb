require 'rails_helper'

describe 'Users search API' do
  describe '/GET /users?' do
    context 'when the user exists' do
      it 'can get a user by email' do
        create_list(:user, 4)

        user = User.create!(first_name: "Bob", last_name: "Evans", phone_number: "1234567", email: "be@gmail.com", google_uid: "1234")

        get "/api/v1/users/find", params: {email: user.email}

        user_response = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful

        expect(user_response).to have_key(:data)

        user_data = user_response[:data]

        expect(user_data).to have_key(:attributes)
        expect(user_data[:id]).to be_a(String)

        attributes = user_data[:attributes]

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

    context 'when there are no users in the database' do
      it 'returns an empty array' do
        create(:user)

        get '/api/v1/users/find', params: {email: "b@email.com"}

        expect(response).to be_successful
        users = JSON.parse(response.body, symbolize_names: true)

        expect(users[:data]).to be_an(Hash)
        expect(users[:data].count).to eq(0)
        expect(users[:data]).to eq({})
      end
    end
  end
end
