class RenameColumnForProducts < ActiveRecord::Migration
  def change
    rename_column :products, :price, :market_price
  end
end
