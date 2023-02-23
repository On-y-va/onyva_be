require 'rails_helper'

describe 'Users Delete API' do
  describe 'DELETE /users:/id' do
    context 'if the user exists' do 
      it 'can delete a user' do
        user = create(:user)

        expect(User.count).to eq(1)
        
        delete "/api/v1/users/#{user.id}"
        
        expect(response).to be_successful
        expect(response.status).to eq(204)
        expect(User.count).to eq(0)
        expect{User.find(user.id)}.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'if the user does not exist' do
      it 'sends an error message' do
        user = create(:user)

        delete "/api/v1/users/#{User.last.id+1}"
        response_body = JSON.parse(response.body, symbolize_names: true)
       
        expect(response).to_not be_successful
        expect(response.status).to eq(404)
        expect(response_body[:error]).to match(/Couldn't find User with 'id'=#{User.last.id+1}/)
        expect(User.count).to eq(1)
      end
    end
  end
end