class Portal::MembersController < Portal::ApplicationController
  
  def index
    authorize Member
    @page_header = "账户列表"
    @action = new_portal_member_path
    @members = policy_scope(Member)
  end
  
  def show
    @page_header = "账户详情"
    # @product = Product.find_by(pid: params[:id])
  end
  
  def new
    @page_header = "新建账户"
    @member = Member.new
    authorize @member
  end
  
  def create
    @member = Member.new(member_params)
    authorize @member
    @member.parent_id = current_member.id
    @member.account_type = Member::ACCOUNT_TYPE_STAFF
    if @member.save
      flash[:success] = '创建成功'
      redirect_to portal_members_url
    else
      render :new
    end
  end
  
  def edit
    @page_header = "更新产品"
    @member = Member.find(params[:id])
    authorize @member
  end
  
  def update
    @member = Member.find(params[:id])
    authorize @member
    if @member.update(member_params)
      flash[:success] = '更新成功'
      redirect_to portal_members_url
    else
      render :edit
    end
  end
  
  def destroy
    @member = Member.find(params[:id])
    authorize @member
    unless @member.destroy
      flash[:alert] = @member.errors.full_messages.join(',')
    end
    redirect_to portal_members_url
  end
  
  private
  def member_params
    params.require(:member).permit(:mobile, :password, :password_confirmation, role_ids: [])
  end
end