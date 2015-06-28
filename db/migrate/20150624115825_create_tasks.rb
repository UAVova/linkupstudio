class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :state, :default => 1

      t.timestamps null: false
    end
  end
end
