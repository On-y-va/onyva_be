class ChangeColumnsToNullInTripEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :trip_events, :event_date, :datetime, null: true
    change_column :trip_events, :event_time, :datetime, null: true
  end
end
