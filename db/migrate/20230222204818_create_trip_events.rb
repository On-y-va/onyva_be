class CreateTripEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_events do |t|
      t.references :trip, foreign_key: true
      t.datetime :event_date
      t.datetime :event_time
      t.string :event_id
      t.integer :votes, default: 0
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
