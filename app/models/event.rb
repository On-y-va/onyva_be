class Event < ApplicationRecord
  belongs_to :trip
 
  validates_presence_of :event_id

  enum category: [:restaurant, :attraction]

  def add_vote
    self.votes += 1
  end
end
