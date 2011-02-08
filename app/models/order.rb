class Order < ActiveRecord::Base
  has_many :adoptions, :dependent => :destroy
  PAYMENT_TYPES = [ 'Check', 'Credit cart', 'Purchase order' ]

  validates :name, :address, :email, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES
  
  def add_adoptions_from_cart(cart)
    cart.adoptions.each do |item|
      item.cart_id = nil
      adoptions << item
    end
  end
end
