class Image
  attr_reader :id, :secret, :server

  def initialize(data)
    @id = data[:id]
    @secret = data[:secret]
    @server = data[:server]
  end

  def url
    "https://live.staticflickr.com/#{@server}/#{@id}_#{@secret}_w.jpg"
  end
end