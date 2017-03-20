class Permission < ActiveRecord::Base
  validates :action, :resource, presence: true
  
  belongs_to :role
  has_many :staffs, through: :role
  
  def permission_name
    I18n.t("common.#{action}") + resource.classify.constantize.model_name.human
  end
end
