class FlickrService
  def self.get_city_image(city, country)
    api_key = ENV['FLICKR_KEY']
    response = conn.get("?method=flickr.photos.search&api_key=#{api_key}&text=#{city}+#{country}+city&per_page=1&page=1&format=json&nojsoncallback=1&sort=interestingness-desc")
    JSON.parse(response.body, symbolize_names: true)
  end

  private 

  def self.conn
    Faraday.new("https://www.flickr.com/services/rest/")
  end
end