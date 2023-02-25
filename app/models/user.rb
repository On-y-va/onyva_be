class User < ApplicationRecord
  has_many :flights
  has_many :trip_attendees, dependent: :destroy
  has_many :trips, through: :trip_attendees, dependent: :destroy

  validates_presence_of :first_name, :last_name, :email, :phone_number, :password_digest
  validates_uniqueness_of :email
  has_secure_password

  def self.find_user_by_email(email)
    self.where("email = ?", "#{email}")
    .first
  end

  def self.find_user_by_flight(flight)
    User.find_by(id: flight.user_id)
  end
end
