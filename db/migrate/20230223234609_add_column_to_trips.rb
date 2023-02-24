class AddColumnToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :start_date, :datetime
    add_column :trips, :end_date, :datetime
  end
end
