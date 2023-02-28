class RenameTripEventsToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_table :trip_events, :events
  end
end
