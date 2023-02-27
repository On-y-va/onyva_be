class UserSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name, :phone_number, :email, :emergency_contact_name, :emergency_contact_phone_number, :uid
end