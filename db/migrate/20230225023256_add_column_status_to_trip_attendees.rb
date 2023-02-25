class AddColumnStatusToTripAttendees < ActiveRecord::Migration[5.2]
  def change
    add_column :trip_attendees, :status, :integer, default: 0
  end
end
