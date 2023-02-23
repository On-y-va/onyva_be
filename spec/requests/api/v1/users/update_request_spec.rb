require 'rails_helper'

describe 'Users update API' do
  describe 'PATCH /users/:id' do
    context 'if the user is successfully updated' do
      it 'updates the user' do
        user = create(:user)
        previous_user_name = User.last.first_name
        user_params = { first_name: "Jeff" }
        headers = { "CONTENT_TYPE" => "application/json" }

        patch "/api/v1/users/#{user.id}", headers: headers, params: JSON.generate({user: user_params})
        response_body = JSON.parse(response.body, symbolize_names: true)
        user = User.find_by(id: user.id)

        expect(response).to be_successful
        expect(user.first_name).to eq("Jeff")
        expect(user.first_name).to_not eq(previous_user_name)
      end
    end
      
    context 'if the user is not updated successfully' do
      it 'fails if to update if user first name is left blank' do
        user = create(:user, first_name: 'Jeff')
        previous_user_description = User.last.first_name
        user_params = { first_name: "" }
        headers = { "CONTENT_TYPE" => "application/json" }
        
        patch "/api/v1/users/#{user.id}", headers: headers, params: JSON.generate({user: user_params})
        response_body = JSON.parse(response.body, symbolize_names: true)
        user = User.find_by(id: user.id)
        
        expect(response).to_not be_successful
        expect(response.status).to eq(400)
        expect(user.first_name).to eq(previous_user_description)
        expect(user.first_name).to eq("Jeff")

        expect(response_body[:error]).to match("Validation failed: First name can't be blank")
      end

      it 'fails if to update if user last name is left blank' do
        user = create(:user, last_name: 'Jeff')
        previous_user_description = User.last.last_name
        user_params = { last_name: "" }
        headers = { "CONTENT_TYPE" => "application/json" }
        
        patch "/api/v1/users/#{user.id}", headers: headers, params: JSON.generate({user: user_params})
        response_body = JSON.parse(response.body, symbolize_names: true)
        user = User.find_by(id: user.id)
        
        expect(response).to_not be_successful
        expect(response.status).to eq(400)
        expect(user.last_name).to eq(previous_user_description)
        expect(user.last_name).to eq("Jeff")

        expect(response_body[:error]).to match("Validation failed: Last name can't be blank")
      end

      it 'fails if to update if user phone number is left blank' do
        user = create(:user, phone_number: '123456789')
        previous_user_description = User.last.phone_number
        user_params = { phone_number: "" }
        headers = { "CONTENT_TYPE" => "application/json" }
        
        patch "/api/v1/users/#{user.id}", headers: headers, params: JSON.generate({user: user_params})
        response_body = JSON.parse(response.body, symbolize_names: true)
        user = User.find_by(id: user.id)
        
        expect(response).to_not be_successful
        expect(response.status).to eq(400)
        expect(user.phone_number).to eq(previous_user_description)
        expect(user.phone_number).to eq("123456789")

        expect(response_body[:error]).to match("Validation failed: Phone number can't be blank")
      end

      it 'fails if to update if user email is left blank' do
        user = create(:user, email: 'jeff@jeff.com')
        previous_user_description = User.last.email
        user_params = { email: "" }
        headers = { "CONTENT_TYPE" => "application/json" }
        
        patch "/api/v1/users/#{user.id}", headers: headers, params: JSON.generate({user: user_params})
        response_body = JSON.parse(response.body, symbolize_names: true)
        user = User.find_by(id: user.id)
        
        expect(response).to_not be_successful
        expect(response.status).to eq(400)
        expect(user.email).to eq(previous_user_description)
        expect(user.email).to eq("jeff@jeff.com")

        expect(response_body[:error]).to match("Validation failed: Email can't be blank")
      end
    end
  end
end