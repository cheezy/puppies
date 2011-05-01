class Puppy < ActiveRecord::Base
  default_scope :order => 'name'
  has_many :adoptions

  before_destroy :ensure_not_referenced_by_any_adoption
  
  validates :name, :breed, :image_url, :presence => true
  validates :fees, :numericality => {:greater_than => 0.00}
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png)}i,
    :message => 'must be a URL for GIF, JPG, or PNG image.'}

  def ensure_not_referenced_by_any_adoption
    if adoptions.count.zero?
      return true
    else
      errors[:base] << "Adoption present"
      return false
    end
  end
end
