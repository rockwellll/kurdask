class AddOldUsernameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :old_username, :string
  end
end
