class FixColumnNameGoogleUid < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :google_uid, :uid  
  end
end
