class City
  attr_reader :city_name,
              :country,
              :postcode,
              :place_id

  def initialize(attributes)
    @city_name = attributes[:properties][:city]
    @country = attributes[:properties][:country]
    @postcode = attributes[:properties][:postcode]
    @place_id = attributes[:properties][:place_id]
  end
end