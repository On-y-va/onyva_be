class Event < ApplicationRecord
  belongs_to :trip
 
  validates_presence_of :event_id

  enum category: [:restaurant, :attraction]
end
