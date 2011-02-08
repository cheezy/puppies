class CombilneItemsInCart < ActiveRecord::Migration
  def self.up
    Cart.all.each do |cart|
      sums = cart.adoptions.group(:puppy_id).sum(:quantity)

      sums.each do |puppy_id, quantity|
        if quantity > 1
          cart.adoptions.where(:puppy_id => puppy_id).delete_all
          cart.adoptions.create(:puppy_id => puppy_id, :quantity => quantity)
        end
      end
    end
  end

  def self.down
    Adoptions.where("quantity>1").each do |adoption|
      adoption.quantity.times do
        Adoptions.create :cart_id => adoption.cart_id, :puppy_id => adoption.puppy_id, :quantity => 1
      end
      adoption.destroy
    end
  end
end
