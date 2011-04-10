class Cart < ActiveRecord::Base
  has_many :adoptions, :dependent => :destroy

  def add_puppy(puppy_id)
    current_adoption = adoptions.where(:puppy_id => puppy_id).first
    unless current_adoption
      current_adoption = Adoption.new(:puppy_id => puppy_id)
      adoptions << current_adoption
    end
    current_adoption
  end

  def total_price
    adoptions.to_a.sum { |adoption| adoption.total_price }
  end
end
