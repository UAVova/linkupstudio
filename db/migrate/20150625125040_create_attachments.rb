class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :entity, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end