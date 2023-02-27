class RemoveColumnRestawurantsFromTrips < ActiveRecord::Migration[5.2]
  def change
    remove_column :trips, :restaurants, :text
  end
end
