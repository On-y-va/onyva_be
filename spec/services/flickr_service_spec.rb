require 'rails_helper'

RSpec.describe FlickrService do
  it 'can return an image based off a city' do
    city_image = FlickrService.get_city_image("Barcelona", "Spain")
    
    expect(city_image).to be_a(Hash)
    expect(city_image).to have_key(:photos)
    expect(city_image[:photos]).to be_an(Hash)
    expect(city_image[:photos]).to have_key(:photo)
    expect(city_image[:photos][:photo]).to be_an(Array)
    expect(city_image[:photos][:photo][0]).to have_key(:id)
    expect(city_image[:photos][:photo][0]).to have_key(:secret)
    expect(city_image[:photos][:photo][0]).to have_key(:server)
  end
end