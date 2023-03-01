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

  def self.record_not_found(error)
    { 
      error: [ 
        { 
          title: error.message,
          status: "404" 
        }
      ]
    }
  end
end