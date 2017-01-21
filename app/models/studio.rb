class Studio < ActiveRecord::Base
  belongs_to :member
  
  validates :name, :address, :contact_name, presence: true
end
