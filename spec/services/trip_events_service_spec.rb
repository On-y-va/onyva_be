require 'rails_helper'

RSpec.describe TripEventsService do
  it 'can return information based off a city', :vcr do
    city_search = TripEventsService.get_city("Barcelona", "Spain")
    
    expect(city_search).to be_a(Hash)
    expect(city_search).to have_key(:features)
    expect(city_search[:features]).to be_an(Array)
    
    city = city_search[:features][0]

    expect(city).to have_key(:properties)
    expect(city[:properties]).to be_a(Hash)

    expect(city[:properties]).to have_key(:country)
    expect(city[:properties][:country]).to be_a(String)

    expect(city[:properties]).to have_key(:city)
    expect(city[:properties][:city]).to be_a(String)

    expect(city[:properties]).to have_key(:postcode)
    expect(city[:properties][:postcode]).to be_a(String)

    expect(city[:properties]).to have_key(:place_id)
    expect(city[:properties][:place_id]).to be_a(String)
  end

  it 'can return restaurant based off a city', :vcr do
    city = CityFacade.get_city_info("Barcelona", "Spain")
    place_id = city.place_id

    restaurant_search = TripEventsService.get_restaurants(place_id)

    expect(restaurant_search).to be_a(Hash)
    expect(restaurant_search).to have_key(:features)
    expect(restaurant_search[:features]).to be_an(Array)
    
    restaurant = restaurant_search[:features][0]
 
    expect(restaurant).to have_key(:properties)
    expect(restaurant[:properties]).to be_a(Hash)

    expect(restaurant[:properties]).to have_key(:name)
    expect(restaurant[:properties][:name]).to be_a(String)

    expect(restaurant[:properties]).to have_key(:address_line1)
    expect(restaurant[:properties][:address_line1]).to be_a(String)

    expect(restaurant[:properties]).to have_key(:address_line2)
    expect(restaurant[:properties][:address_line2]).to be_a(String)
  end
end