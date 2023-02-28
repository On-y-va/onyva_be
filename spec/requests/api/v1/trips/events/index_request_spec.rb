require 'rails_helper'

describe 'Trip Trip Events Index API' do
  describe '/GET /trip/:id/events' do
    it 'can get all trip events' do
      t1 = create(:trip)

      u1 = create(:user)
      ta1 = create(:trip_attendee, user_id: u1.id, trip_id: t1.id)
      f1 = create(:flight, user_id: u1.id)

      te1 = create(:event, trip_id: t1.id)

      get "/api/v1/trips/#{t1.id}/events"

      events_response = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(response).to be_successful
      
      events_response.each do |trip_event| 
        expect(trip_event).to have_key(:id)
   
        expect(trip_event[:attributes]).to have_key(:trip_id)
        expect(trip_event[:attributes][:trip_id]).to be_a(Integer)

        expect(trip_event[:attributes]).to have_key(:event_date)
        expect(trip_event[:attributes][:event_date]).to be_a(String)

        expect(trip_event[:attributes]).to have_key(:event_time)
        expect(trip_event[:attributes][:event_time]).to be_a(String)

        expect(trip_event[:attributes]).to have_key(:event_id)
        expect(trip_event[:attributes][:event_id]).to be_a(String)

        expect(trip_event[:attributes]).to have_key(:votes)
        expect(trip_event[:attributes][:votes]).to be_a(Integer)

        expect(trip_event[:attributes]).to have_key(:confirmed)
        expect(trip_event[:attributes][:confirmed]).to be_in([true, false])
      end
    end
  end
end