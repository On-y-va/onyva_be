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

  describe 'instance methods' do
    describe '#users_going' do
      it 'returns a list of users who accepted the trip invitation' do
        trip = create(:trip)

        user = create(:user)
        user2 = create(:user)
        user3 = create(:user)
        user4 = create(:user)

        TripAttendee.create(trip_id: trip.id, user_id: user.id, status: 1)
        TripAttendee.create(trip_id: trip.id, user_id: user2.id, status: 1)
        TripAttendee.create(trip_id: trip.id, user_id: user3.id, status: 0)
        TripAttendee.create(trip_id: trip.id, user_id: user4.id, status: 0)

        expect(trip.users_going).to eq([user, user2])
        expect(trip.users_going).to_not include(user3)
      end
    end

    describe '#most_popular_event' do
      it 'returns the event with the most votes' do
        trip = create(:trip)

        event = create(:event, trip_id: trip.id, votes: 0)
        event2 = create(:event, trip_id: trip.id, votes: 3)
        event3 = create(:event, trip_id: trip.id, votes: 5)

        expect(trip.most_popular_event).to eq(event3)
      end
    end
  end
end