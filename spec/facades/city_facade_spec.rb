require 'rails_helper'

RSpec.describe CityFacade do
  it 'can return the city, country, postcode, and place id', :vcr do
    city = CityFacade.get_city_info("Barcelona", "Spain", "08001")

    expect(city).to be_a(City)
  end

  it 'can return a restaurant with its name and address', :vcr do
    city = CityFacade.get_city_info("Barcelona", "Spain", "08001")
    place_id = city.place_id
  
    restaurants = CityFacade.get_restaurant_info(place_id)

    expect(restaurants).to be_an(Array)
    expect(restaurants[0]).to be_a(Restaurant)
  end

  it 'can return a tourist attraction with its name and address' do
    city = CityFacade.get_city_info("Barcelona", "Spain", "08001")
    place_id = city.place_id

    tourist_attractions = CityFacade.get_tourist_attraction_info(place_id)

    expect(tourist_attractions).to be_an(Array)
    expect(tourist_attractions[0]).to be_an(TouristAttraction)
  end
end