class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :password_digest
      t.string :emergency_contact_name, :null => true
      t.string :emergency_contact_phone_number, :null => true
    end
  end
end
