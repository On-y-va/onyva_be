require 'rails_helper'

describe 'Users create API' do
  describe 'POST /users' do
    context 'when a user is successfully created' do
      it 'can create a new user' do 
        user_params = ({ 
                        first_name: 'Harry',
                        last_name: 'Potter',
                        email: 'harry.potter@hogwarts.com',
                        phone_number: '123456789',
                        password: 'password123',
                        password_confirmation: 'password123'
                      })

        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)
        new_user = User.last

        expect(response).to be_successful
        expect(response.status).to eq(201)
        expect(new_user.first_name).to eq(user_params[:first_name])
        expect(new_user.last_name).to eq(user_params[:last_name])
        expect(new_user.email).to eq(user_params[:email])
      end
    end

    context 'when a user is not created' do
      it 'fails to create a user when the first name is left empty' do
        user_params = ({ 
          first_name: '',
          last_name: 'Potter',
          email: 'harry.potter@hogwarts.com',
          phone_number: '123456789',
          password: 'password123',
          password_confirmation: 'password123'
        })

        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)
      end
    end
  end
end