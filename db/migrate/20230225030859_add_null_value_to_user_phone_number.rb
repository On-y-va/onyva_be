class AddNullValueToUserPhoneNumber < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :phone_number, :string, null: true
  end
end
