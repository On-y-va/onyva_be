class Flight < ApplicationRecord
  belongs_to :user
  # belongs_to :trip
  # has_many :trips, through: :user
  validates_presence_of :airline_code, :flight_number, :date
end
