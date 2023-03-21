class Flight < ApplicationRecord
  belongs_to :user
  
  validates_presence_of :flight_number, :date

  def flight_user_name
    self.user.first_name
  end
end
