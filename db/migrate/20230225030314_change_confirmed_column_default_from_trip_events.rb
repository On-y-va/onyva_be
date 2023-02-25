class ChangeConfirmedColumnDefaultFromTripEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :trip_events, :confirmed, :boolean, :default => false
  end
end
