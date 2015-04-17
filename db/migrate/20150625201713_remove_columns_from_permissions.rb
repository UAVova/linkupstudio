class RemoveColumnsFromPermissions < ActiveRecord::Migration
  def change
    remove_column :permissions, :group_id, :string
  end
end
