class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def access_denied(exception)
    redirect_to cpanel_root_path, alert: exception.message
  end
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:mobile, :code])
    end
  
  # 需要登录
  def require_member
    if current_member.blank?
      respond_to do |format|
        format.html { authenticate_member! }
        format.all  { head(:unauthorized) }
      end
    end
  end
  
  # 检查用户账号是否被冻结
  def check_member
    unless current_member.verified
      flash[:error] = "您的账号已经被冻结"
      redirect_to root_path
    end
  end
  
  # 检查用户是否已经完善了资料
  def check_more_profile
    if current_member.account_type.blank?
      redirect_to more_profile_path
    end
  end
  
  def after_sign_in_path_for(admin_user)
    cpanel_root_path
  end
  
  def after_sign_in_path_for(member_user)
    if member_user.account_type.blank?
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
