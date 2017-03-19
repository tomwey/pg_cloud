class Role < ActiveRecord::Base
  
  has_many :permissions, dependent: :destroy
  has_and_belongs_to_many :staffs, class_name: 'Member', join_table: :roles_staffs, association_foreign_key: 'staff_id'
  belongs_to :member, foreign_key: 'owner_id'
  
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :owner_id
  
  def self.allowed_permissions
    
    permissions = []
    ApplicationPolicy.policies.each do |policy|
      policy.actions.each do |action|
        permission = []
        
        klass = Object.const_get policy.resource.to_s
        permission << I18n.t("common.#{action}") + klass.model_name.human
        permission << "#{action}##{policy.resource}"
        
        permissions << permission
      end
    end
    
    permissions
  end
end
