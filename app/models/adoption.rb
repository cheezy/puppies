class Adoption < ActiveRecord::Base
  belongs_to :puppy
  belongs_to :cart

  def total_price
    puppy.fees
  end
end
