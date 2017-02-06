class Portal::ApplicationController < ApplicationController
  layout 'portal'
  
  before_filter :require_member
  before_filter :check_member
  before_filter :check_more_profile
  
  def after_sign_in_path_for(resource)
    if resource.account_type.blank?
      # 还未完善资料
      more_profile_path
    else
      portal_root_path
    end
  end
  
  def after_sign_out_path_for(resource)
    new_member_session_path
  end
end