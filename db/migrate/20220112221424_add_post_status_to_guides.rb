class AddPostStatusToGuides < ActiveRecord::Migration[5.2]
  def change
    add_column :guides, :status, :integer, default: 0
  end
end
