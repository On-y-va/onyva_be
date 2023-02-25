class AddColumnRestaurantsToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :restaurants, :text, array: true, default: [], null: true
  end
end
