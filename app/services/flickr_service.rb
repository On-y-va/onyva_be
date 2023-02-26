class FlickrService
  def self.get_city_image(city, country)
    api_key = ENV['FLICKR_KEY']
    response = conn.get("?method=flickr.photos.search&api_key=#{api_key}&text=#{city}+#{country}+city&per_page=1&page=1&format=json&nojsoncallback=1&sort=interestingness-desc&geo_context=2")
    JSON.parse(response.body, symbolize_names: true)
  end

  private 

  def self.conn
    Faraday.new("https://www.flickr.com/services/rest/")
  end
end

# https://live.staticflickr.com/{server-id}/{id}_{secret}_w.jpg

# https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=76ad2aabcac8dab680e84bff4c479993&text=London England city&per_page=1&page=1&format=json&sort=interestingness-desc&geo_context=2