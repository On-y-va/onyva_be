require 'rails_helper'

RSpec.describe Image do
  it 'exists and has attibutes' do
    image = FlickrFacade.get_city_image("Barcelona", "Spain")
    
    expect(image).to be_a(Image)
    #cant test exact input because the image can change
    expect(image).to respond_to(:id)
    expect(image).to respond_to(:server)
    expect(image).to respond_to(:secret)
  end
end