class ChangePlaceIdForTrips < ActiveRecord::Migration[5.2]
  def change
    change_column :trips, :place_id, :string, null: true
  end
end
