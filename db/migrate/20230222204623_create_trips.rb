class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :postcode
      t.string :place_id
    end
  end
end
