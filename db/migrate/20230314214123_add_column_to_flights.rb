class AddColumnToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :status, :string, :null => true
  end
end
