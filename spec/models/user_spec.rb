require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:flights) }
    it { should have_many(:trip_attendees) }
    it { should have_many(:trips).through(:trip_attendees) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:phone_number) }
    it {should validate_presence_of(:password_digest)}
    it { should have_secure_password }
  end

  describe '#find_user_by_email' do
    it 'returns a user by the email' do
      user = User.create!(first_name: "Bob", last_name: "Evans", phone_number: "1234567", email: "be@gmail.com", password: "123")
      user2 = User.create!(first_name: "Alex", last_name: "Barrett", phone_number: "1234567", email: "abe@gmail.com", password: "123")
      user3 = User.create!(first_name: "Alex", last_name: "Barrett", phone_number: "1234567", email: "e@gmail.com", password: "123")

      expect(User.find_user_by_email("be@gmail.com")).to eq(user)
      expect(User.find_user_by_email("e@gmail.com")).to_not eq(user)
      expect(User.find_user_by_email("e@gmail.com")).to eq(user3)
    end
  end
end