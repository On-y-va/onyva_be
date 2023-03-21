require 'rails_helper'

RSpec.describe AeroService, :vcr do
  describe '#get_flight_status' do
    it 'returns the flight status from a given flight number' do
      flight_response = AeroService.get_flight_status("DLH452")

      expect(flight_response).to be_a(Array)
      expect(flight_response[0]).to have_key(:status)
      expect(flight_response[0][:status]).to be_a(String)
    end
  end
end