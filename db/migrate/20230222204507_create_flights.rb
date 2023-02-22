class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.references :user, foreign_key: true
      t.string :airline_code
      t.string :flight_number
      t.datetime :date
    end
  end
end
