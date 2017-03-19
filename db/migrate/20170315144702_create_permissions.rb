class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :action,   null: false
      t.string :resource, null: false
      t.integer :role_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
