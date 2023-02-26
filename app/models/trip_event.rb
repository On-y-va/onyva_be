class TripEvent < ApplicationRecord
  belongs_to :trip
 
  validates_presence_of :event_id
end
