require 'rails_helper'

RSpec.describe Image do
  it 'exists and has attibutes' do
    image = FlickrFacade.get_city_image("Barcelona", "Spain")
    
    expect(image).to respond_to(:id)
    expect(image).to respond_to(:server)
    expect(image).to respond_to(:secret)
    expect(image).to respond_to(:url)
    expect(image.url).to be_a(String)
  end
end