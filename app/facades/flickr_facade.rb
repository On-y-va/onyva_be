class FlickrFacade
  def self.get_city_image(city, country)
    image = FlickrService.get_city_image(city, country)[:photos][:photo][0]
    "https://live.staticflickr.com/#{image[:server]}/#{image[:id]}_#{image[:secret]}_w.jpg"
  end
end