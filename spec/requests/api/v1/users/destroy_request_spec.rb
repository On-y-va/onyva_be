require 'rails_helper'

describe 'Users Delete API' do
  describe 'DELETE /users:/id' do
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
end