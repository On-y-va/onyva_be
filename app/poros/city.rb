class City
  attr_reader :name,
              :country,
              :postcode,
              :place_id

  def initialize(attributes)
    @name = attributes[:properties][:city]
    @country = attributes[:properties][:country]
    @postcode = attributes[:properties][:postcode]
    @place_id = attributes[:properties][:place_id]
  end
end