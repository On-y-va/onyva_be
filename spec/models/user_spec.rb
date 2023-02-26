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

  describe '#find_user_by_flight' do
    it 'returns the user from flight' do 
      t1 = Trip.create!(name: "Test Trip", city: "London", country: "United States", postcode: "1234", start_date: "1", end_date: "2")
      u1 = User.create!(first_name: "M", last_name: "M", phone_number: "1234", email: "asdfasdf@asdf.com", password: "1", password_confirmation: "1")
      ta1 = TripAttendee.create!(user_id: u1.id, trip_id: t1.id)
      f1 = Flight.create!(user_id: u1.id, airline_code: "SW", flight_number: "1", date: DateTime.new(2012, 8, 29, 22, 35, 0))

      expect(User.find_user_by_flight(f1)).to eq(u1)
    end
  end

  describe '#find_user_trip_by_status' do
    it "returns a user's trip based off status" do
      user = create(:user)

      trip_1 = create(:trip)
      trip_2 = create(:trip)
      trip_3 = create(:trip)
      trip_4 = create(:trip)
      trip_5 = create(:trip)
      trip_6 = create(:trip)

      trip_attendees_1 = create(:trip_attendee, user_id: user.id, trip_id: trip_1.id, status: 0)
      trip_attendees_2 = create(:trip_attendee, user_id: user.id, trip_id: trip_2.id, status: 0)
      trip_attendees_3 = create(:trip_attendee, user_id: user.id, trip_id: trip_3.id, status: 1)
      trip_attendees_4 = create(:trip_attendee, user_id: user.id, trip_id: trip_4.id, status: 1)
      trip_attendees_5 = create(:trip_attendee, user_id: user.id, trip_id: trip_5.id, status: 1)
      trip_attendees_6 = create(:trip_attendee, user_id: user.id, trip_id: trip_6.id, status: 2)
    
      expect(user.find_user_trip_by_status(0)).to eq([trip_1, trip_2])
      expect(user.find_user_trip_by_status(1)).to eq([trip_3, trip_4, trip_5])
      expect(user.find_user_trip_by_status(2)).to eq([trip_6])
      expect(user.find_user_trip_by_status(1)).to_not eq([trip_1, trip_6])
      expect(user.find_user_trip_by_status(0)).to_not eq([trip_3, trip_5])
      expect(user.find_user_trip_by_status(2)).to_not eq([trip_1])
    end
  end
end