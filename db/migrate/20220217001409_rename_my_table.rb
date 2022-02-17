class RenameMyTable < ActiveRecord::Migration[5.2]
  def change
    def self.up 
      rename_table :ussers, :users 
    end 
    
    def self.down 
      rename_table :users, :ussers 
    end

  end
end
