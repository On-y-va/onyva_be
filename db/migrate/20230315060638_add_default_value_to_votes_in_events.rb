class AddDefaultValueToVotesInEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :votes, :integer, default: 0
  end
end
