class Trip < ApplicationRecord
  has_many :trip_attendees, dependent: :destroy
  has_many :trip_events, dependent: :destroy
  has_many :users, through: :trip_attendees, dependent: :destroy

  validates_presence_of :name, :city, :country, :postcode, :start_date, :end_date
end