class Trip < ApplicationRecord
  include ActiveModel::Validations
  has_many :trip_attendees, dependent: :destroy
  has_many :users, through: :trip_attendees, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :flights, through: :users, dependent: :destroy
  
  validates_presence_of :name, :city, :country, :postcode, :start_date, :end_date
  validates_with TripValidator
end