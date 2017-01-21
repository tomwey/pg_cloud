class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :business_license_no, null: false, index: true, unique: true
      t.string :business_license_image, null: false
      t.string :contact_name, null: false
      t.string :contact_number

      t.timestamps null: false
    end
  end
end
