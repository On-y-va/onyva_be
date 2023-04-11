class UserSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :phone_number, :email, :emergency_contact_name, :emergency_contact_phone_number, :google_uid
  
  def self.no_matches_found
    { 
      error: [ 
        { 
          title: "Invalid Email given",
          status: "404" 
        }
      ]
    }
  end
end
  