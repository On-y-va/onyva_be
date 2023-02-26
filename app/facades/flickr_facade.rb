class FlickrFacade
  def self.get_city_image(city, country)
    image_info = FlickrService.get_city_image(city, country)[:photos]
    image = image_info[:photo][0]
    Image.new(image)
  end
end