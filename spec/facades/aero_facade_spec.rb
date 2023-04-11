require 'rails_helper'

RSpec.describe AeroFacade do

  it 'can return the place id', :vcr do
    flight_status = AeroFacade.get_flight_status("DLH452")

    expect(flight_status).to be_a(String)
  end
end