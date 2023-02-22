class TripEvent < ApplicationRecord
  belongs_to :trip
 
  validates_presence_of :event_date, :event_time, :event_id
end
