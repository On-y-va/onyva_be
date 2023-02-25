class TripAttendee < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  enum status: [:pending, :accepted, :declined]
end