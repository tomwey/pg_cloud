class AddMemberIdToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :member_id, :integer
    add_index :companies, :member_id
  end
end
