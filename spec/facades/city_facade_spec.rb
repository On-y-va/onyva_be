require 'rails_helper'

RSpec.describe CityFacade do

  it 'can return the place id', :vcr do
    city = CityFacade.get_city_info("Barcelona", "Spain", "08001")

    expect(city).to be_a(String)
  end

  it 'creates restaurants', :vcr do
    events = Event.all.count 
    user = create(:user)
    expect(User.count).to eq(1)

    expect(Trip.count).to eq(0)
    trip_params = {
      name: "Girl's Trip",
      city: "Denver",
      country: "United States",
      postcode: '80020',
      start_date: "11/08/25",
      end_date: "11/20/25"
    }
    Trip.create!(trip_params)
    place_id = CityFacade.get_city_info("Barcelona", "Spain", "08001")

    restaurants = CityFacade.get_restaurant_info(place_id, Trip.last.id)
    expect(Event.all.count > events).to be(true)
  end

  it 'creates restaurants' do
    events = Event.all.count 
    user = create(:user)
    expect(User.count).to eq(1)

    expect(Trip.count).to eq(0)
    trip_params = {
      name: "Girl's Trip",
      city: "Denver",
      country: "United States",
      postcode: '80020',
      start_date: "11/08/25",
      end_date: "11/20/25"
    }
    Trip.create!(trip_params)
    place_id = CityFacade.get_city_info("Barcelona", "Spain", "08001")

    tourist_attractions = CityFacade.get_tourist_attraction_info(place_id, Trip.last.id)

    expect(Event.all.count > events).to be(true)
  end
end