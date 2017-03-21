class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :o_id
      t.string :wx_id
      t.string :avatar
      t.string :nickname
      t.string :realname
      t.string :mobile
      t.string :address
      t.integer :owner_id

      t.timestamps null: false
    end
    add_index :customers, :owner_id
    add_index :customers, :wx_id
    add_index :customers, :o_id, unique: true
  end
end
