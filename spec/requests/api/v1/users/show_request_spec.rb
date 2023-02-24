require 'rails_helper'

describe 'Users show API' do
  describe 'GET /users/:id' do
    context 'when the user exists' do
      it 'can get one user by their id' do
        user = create(:user)

        get "/api/v1/users/#{user.id}"

        user_response = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful

        expect(user_response).to have_key(:data)
        expect(user_response[:data]).to have_key(:attributes)

        expect(user_response[:data][:id]).to be_a(String)

        user_data = user_response[:data][:attributes]
        
        expect(user_data).to have_key(:first_name)
        expect(user_data[:first_name]).to be_a(String)
        
        expect(user_data).to have_key(:last_name)
        expect(user_data[:last_name]).to be_a(String)
        
        expect(user_data).to have_key(:email)
        expect(user_data[:email]).to be_a(String)
        
        expect(user_data).to have_key(:phone_number)
        expect(user_data[:phone_number]).to be_a(String)
        
        expect(user_data).to have_key(:password_digest)
        expect(user_data[:password_digest]).to be_a(String)
        
        expect(user_data).to have_key(:emergency_contact_name)
        expect(user_data[:emergency_contact_name]).to be_nil
        
        expect(user_data).to have_key(:emergency_contact_phone_number)
        expect(user_data[:emergency_contact_phone_number]).to be_nil
      end
    end

    context 'when the user does not exist' do
      it 'responds with an error' do
        user = create(:user)

        get "/api/v1/users/#{User.last.id+1}"

        expect(response).to_not be_successful
        
        user = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(404)
        expect(user).to have_key(:error)
       
        expect(user[:error]).to match(/Couldn't find User with 'id'=#{User.last.id+1}/)
      end
    end
  end
end