class AddColumnsToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :token, :string
  end
end
