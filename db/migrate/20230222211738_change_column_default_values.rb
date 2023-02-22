class ChangeColumnDefaultValues < ActiveRecord::Migration[5.2]
  def change
    change_column_default :trip_events, :votes, :default => 0
    change_column_default :trip_events, :confirmed, :default => false
  end
end
