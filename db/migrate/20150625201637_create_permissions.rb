class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer  :action_id
      t.string  :subject_class
      t.integer :subject_id
      t.integer :group_id
    end
  end
end
