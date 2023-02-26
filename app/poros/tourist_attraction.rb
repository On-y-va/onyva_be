class TouristAttraction
  attr_reader :name, 
              :address, 
              :place_id

  def initialize(attributes)
    @name = attributes[:properties][:name]
    @address= attributes[:properties][:address_line2]
    @place_id = attributes[:properties][:place_id]
  end
end