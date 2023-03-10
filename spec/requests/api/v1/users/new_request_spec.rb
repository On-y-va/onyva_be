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
                        google_uid: "gehg490ga1no"
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
      it 'fails to create a user when the first name is left blank' do
        user_params = ({ 
                        first_name: '',
                        last_name: 'Potter',
                        email: 'harry.potter@hogwarts.com',
                        phone_number: '123456789',
                        google_uid: "gehg490ga1no"
                      })

        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response.status).to be(400)
        expect(response_body[:error].first[:title]).to eq("Validation failed: First name can't be blank")
      end

      it 'fails to create a user when the last name is left blank' do
        user_params = ({ 
                        first_name: 'Harry',
                        last_name: '',
                        email: 'harry.potter@hogwarts.com',
                        phone_number: '123456789',
                        google_uid: "gehg490ga1no"
                      })

        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response.status).to be(400)
        expect(response_body[:error].first[:title]).to eq("Validation failed: Last name can't be blank")
      end

      it 'fails to create a user when the email is left blank' do
        user_params = ({ 
                        first_name: 'Harry',
                        last_name: 'Potter',
                        email: '',
                        phone_number: '123456789',
                        google_uid: "gehg490ga1no"
                      })

        headers = { "CONTENT_TYPE" => "application/json" }

        post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)
        response_body = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response.status).to be(400)
        expect(response_body[:error].first[:title]).to eq("Validation failed: Email can't be blank")
      end
    end
  end
end