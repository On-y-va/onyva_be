class Flight < ApplicationRecord
  belongs_to :user
  
  validates_presence_of :airline_code, :flight_number, :date
end
