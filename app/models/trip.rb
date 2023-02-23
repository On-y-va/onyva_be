class Trip < ApplicationRecord
  has_many :trip_attendees, dependent: :destroy
  has_many :trip_events, dependent: :destroy

  validates_presence_of :name, :city, :country, :postcode
end