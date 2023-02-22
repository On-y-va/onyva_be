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
end