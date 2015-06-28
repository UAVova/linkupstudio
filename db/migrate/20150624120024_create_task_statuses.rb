class CreateTaskStates < ActiveRecord::Migration
  def change
    create_table :task_states do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
