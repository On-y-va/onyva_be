require 'rails_helper'

RSpec.describe 'Events Update API' do
  describe 'Events update API' do
    describe 'PATCH /trips/:id' do
    context 'if the event is voted for' do
      it 'updates the event vote count' do
        trip = create(:trip, start_date: Time.now, end_date: Time.now)
        event = create(:event)

        headers = { "CONTENT_TYPE" => "application/json" }
        
        patch "/api/v1/trips/#{trip.id}/events/#{event.id}", headers: headers
        response_body = JSON.parse(response.body, symbolize_names: true)
        
        expect(response).to be_successful
      end
    end

    end
  end
end



