class AddAccountTypeToMembers < ActiveRecord::Migration
  def change
    add_column :members, :account_type, :integer
  end
end
