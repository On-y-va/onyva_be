require 'rails_helper'

RSpec.describe CityFacade do
  it 'can return the city, country, postcode, and place id', :vcr do
    city = CityFacade.get_city_info("Barcelona")

    expect(city).to be_a(Array)
    expect(city[0]).to be_a(City)
  end
end