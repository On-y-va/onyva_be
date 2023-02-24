require 'rails_helper'

RSpec.describe City do
  it 'exists and has attibutes', :vcr do
    city = CityFacade.get_city_info("Barcelona", "Spain")

    expect(city).to be_a(City)
    expect(city.city_name).to eq("Barcelona")
    expect(city.country).to eq("Spain")
    expect(city.postcode).to eq("08001")
    expect(city.place_id).to eq("51040fc292616b014059402bd5aa02b14440f00101f9012e4f050000000000c00207")
  end
end