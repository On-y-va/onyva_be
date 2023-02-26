require 'rails_helper'

RSpec.describe TouristAttraction do
  it 'exists and has attributes' do
    city= CityFacade.get_city_info("Barcelona", "Spain", "08001")
    place_id = city.place_id

    tourist_attraction = CityFacade.get_tourist_attraction_info(place_id)

    expect(tourist_attraction[0]).to be_a(TouristAttraction)
    expect(tourist_attraction[0].name).to eq("Mercat de Sant Josep - La Boqueria")
    expect(tourist_attraction[0].address).to eq("La Rambla, 91, 08001 Barcelona, Spain")
    expect(tourist_attraction[0].place_id).to eq("51a162dcef6b5f0140597888e141dcb04440f00101f9015ff55f00000000009203224d65726361742064652053616e74204a6f736570202d204c6120426f717565726961")
  end
end