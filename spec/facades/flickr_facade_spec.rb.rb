require 'rails_helper'

RSpec.describe FlickrFacade do
  it 'can return an image based on the city & country' do
    image = FlickrFacade.get_city_image("Barcelona", "Spain")

    expect(image).to be_a(Image)
  end
end