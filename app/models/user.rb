class User < ApplicationRecord
  has_many :flights, dependent: :destroy
  has_many :trip_attendees, dependent: :destroy
  has_many :trips, through: :trip_attendees, dependent: :destroy

  validates_presence_of :first_name, :last_name, :email, :google_uid
  validates_uniqueness_of :email
  validates_uniqueness_of :google_uid

  enum status: { pending: 0, accepted: 1, declined: 2 }

  def self.find_user_by_email(email)
    self.where("email = ?", "#{email}")
    .first
  end

  def self.find_users_by_email(user_emails)
     self.where(email: user_emails)
  end

  def self.find_user_by_flight(flight)
    self.find_by(id: flight.user_id)
  end

  def find_user_trip_by_status(trip_status)
   self.trips.joins(:trip_attendees)
   .where('trip_attendees.status = ?', trip_status)
   .distinct
  end
end
