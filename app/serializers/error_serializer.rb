class ErrorSerializer
  def self.no_matches_found
    {
      "data": {}
    }
  end

  def self.invalid_parameters(error) 
    {
      "data": {
                "errors": error
              }
    }
  end

  def self.bad_request(error)
    {
      "errors": error
    }
  end
end