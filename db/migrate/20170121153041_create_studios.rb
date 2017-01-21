class CreateStudios < ActiveRecord::Migration
  def change
    create_table :studios do |t|
      t.string :name,    null: false
      t.string :address, null: false
      t.string :contact_name, null: false
      t.string :contact_number
      t.integer :member_id, index: true

      t.timestamps null: false
    end
  end
end
