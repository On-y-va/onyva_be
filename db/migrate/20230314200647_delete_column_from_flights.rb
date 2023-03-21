class DeleteColumnFromFlights < ActiveRecord::Migration[5.2]
  def change
    remove_column :flights, :airline_code
  end
end
