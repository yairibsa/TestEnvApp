class RenameUssersToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_table :ussers, :users
  end
end
