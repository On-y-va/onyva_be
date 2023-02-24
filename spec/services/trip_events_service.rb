require 'rails_helper'

RSpec.describe TripEventsService do
  it 'can return information based off a city' do
    city_search = TripEventsService.get_city_info("Barcelona")

    expect(city_search).to be_a(Hash)
    expect(city_search).to have_key(:data)
  end
end