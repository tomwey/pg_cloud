class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :pid
      t.string :name,   null: false
      t.string :intro
      t.text   :body,   null: false
      t.string :image,  null: false
      t.integer :price, null: false
      t.integer :discount_price, null: false
      t.integer :stock
      t.integer :view_count, default: 0
      t.integer :orders_count, default: 0
      t.integer :photos_quantity, null: false
      t.integer :owner_id, null: false
      t.integer :sort, default: 0

      t.timestamps null: false
    end
    add_index :products, :pid, unique: true
    add_index :products, :owner_id
  end
end
