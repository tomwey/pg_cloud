class Company < ActiveRecord::Base
  belongs_to :member
  
  validates :name, :address,:business_license_no, :business_license_image, :contact_name, presence: true
  validates_uniqueness_of :business_license_no
  
  mount_uploader :business_license_image, PortraitImageUploader
end
