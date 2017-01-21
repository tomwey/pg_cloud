class AddParentIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :parent_id, :integer
    add_index :members, :parent_id
  end
end
