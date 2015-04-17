class CreateGroupPermissions < ActiveRecord::Migration
  def change
    create_table :group_permissions do |t|
      t.integer :permission_id
      t.integer :group_id
    end
  end
end
