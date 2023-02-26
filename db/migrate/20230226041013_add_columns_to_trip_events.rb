class AddColumnsToTripEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :trip_events, :name, :string, null: true
    add_column :trip_events, :address, :string, null: true
  end
end
