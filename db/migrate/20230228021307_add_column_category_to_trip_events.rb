class AddColumnCategoryToTripEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :trip_events, :category, :integer, :null => true
  end
end
