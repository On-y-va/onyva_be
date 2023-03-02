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
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }

    describe 'custom validations' do
      describe '#end_date_after_start_date?' do
        it 'doesnt create a trip if the dates are not valid' do
          trip = Trip.create(city: "mboro", country: "United states", name: "test", postcode: "123456", start_date: "12/12/23", end_date: "12/1/23")

          expect(Trip.exists?(trip.id)).to eq(false)
        end
      end
    end
  end
end