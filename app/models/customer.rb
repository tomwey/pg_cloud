class Customer < ActiveRecord::Base
  belongs_to :owner, class_name: 'Member', foreign_key: 'owner_id'
  
  mount_uploader :avatar, AvatarUploader
  
  before_create :generate_o_id
  def generate_o_id
    begin
      n = rand(10)
      if n == 0
        n = 8
      end
      self.o_id = n.to_s + SecureRandom.random_number.to_s[2..8]
    end while self.class.exists?(:o_id => o_id)
  end
end
