require 'rails_helper'

RSpec.describe Restaurant do
  it 'exists and has attributes', :vcr do
    city = CityFacade.get_city_info("Barcelona", "Spain", "08001")
    place_id = city.place_id

    restaurant = CityFacade.get_restaurant_info(place_id)

    expect(restaurant[0].name).to eq("Asador de Aranda")
    expect(restaurant[0].address).to eq("Avinguda del Tibidabo, 31, 08001 Barcelona, Spain")
    expect(restaurant[0].place_id).to eq("5144c8b54801130140596f565371e7b44440f00101f901ca18790000000000920310417361646f72206465204172616e6461")
  end
end