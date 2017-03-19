class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, null: false
      t.integer :owner_id, null: false

      t.timestamps null: false
    end
    add_index :roles, :owner_id
  end
end
