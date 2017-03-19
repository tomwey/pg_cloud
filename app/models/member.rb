class Member < ActiveRecord::Base
  
  ACCOUNT_TYPE_STUDIO  = 1 # 工作室账户
  ACCOUNT_TYPE_COMPANY = 2 # 公司顶级账户
  ACCOUNT_TYPE_STAFF   = 3 # 公司下面的子账户
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:mobile]
         
  mount_uploader :avatar, AvatarUploader
  
  belongs_to :parent, class_name: 'Member', foreign_key: 'parent_id'
  has_many   :staffs, class_name: 'Member', foreign_key: 'parent_id'
  
  # has_many :roles, foreign_key: 'owner_id'
  
  has_and_belongs_to_many :roles, join_table: :roles_staffs, class_name: 'Role', foreign_key: 'staff_id'
  # has_and_belongs_to_many :roles, join_table: :roles_staffs, foreign_key: 'staff_id'
  # has_many :permissions, through: :roles
  
  attr_accessor :code
  
  validates :mobile, presence: true
  validates :mobile, format: { with: /\A1[3|4|5|8|7][0-9]\d{8}\z/, message: "请输入11位正确手机号" }, length: { is: 11 },:uniqueness => true
  
  before_create :generate_o_id_and_private_token
  def generate_o_id_and_private_token
    begin
      n = rand(10)
      if n == 0
        n = 8
      end
      self.o_id = n.to_s + SecureRandom.random_number.to_s[2..8]
    end while self.class.exists?(:o_id => o_id)
    self.private_token = SecureRandom.uuid.gsub('-', '')
  end
  
  ### 重写devise方法
  def email_required?
    false
  end
  
  def email_changed?
    false
  end
  
  # 是否是管理员
  def admin?
    ( (account_type == Member::ACCOUNT_TYPE_STUDIO or account_type == Member::ACCOUNT_TYPE_COMPANY) and parent_id.blank? )
  end
  
  def company?
    admin? and account_type == Member::ACCOUNT_TYPE_COMPANY
  end
   
         
end
