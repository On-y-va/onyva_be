require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'relationships' do
    it { should have_many(:events) }
    it { should have_many(:trip_attendees) }  
    it { should have_many(:flights).through(:users)}
    it { should have_many(:users).through(:trip_attendees) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:postcode) }
  end
end