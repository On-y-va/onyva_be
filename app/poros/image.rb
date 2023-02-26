class Image
  attr_reader :id, :secret, :server

  def initialize(data)
    @id = data[:id]
    @secret = data[:secret]
    @server = data[:server]
  end
end