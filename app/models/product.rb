class Product < ActiveRecord::Base
  belongs_to :member, foreign_key: 'owner_id'
  
  validates :name, :body, :image, :market_price, :discount_price, :photos_quantity, :owner_id, presence: true
  validates_numericality_of :market_price, :discount_price, :photos_quantity, :stock, only_integer: true, greater_than_or_equal_to: 0
  mount_uploader :image, ImageUploader
  
  scope :sorted, -> { order('sort asc') }
  scope :recent, -> { order('id desc') }
  
  before_create :generate_pid
  def generate_pid
    begin
      n = rand(10)
      if n == 0
        n = 8
      end
      self.pid = n.to_s + SecureRandom.random_number.to_s[2..8]
    end while self.class.exists?(:pid => pid)
  end
  
end

# t.string :pid
# t.string :name,   null: false
# t.string :intro
# t.text   :body,   null: false
# t.string :image,  null: false
# t.integer :price, null: false
# t.integer :discount_price, null: false
# t.integer :stock
# t.integer :view_count, default: 0
# t.integer :orders_count, default: 0
# t.integer :photos_quantity, null: false
# t.string :owner_id, null: false
