class Store < ActiveRecord::Base
  has_many :employees
  validates_presence_of :name, :annual_revenue
  validates_length_of :name, minimum: 3
  validates_numericality_of :annual_revenue,
    integer_only: true,
    greater_than_or_equal_to: 0
  validate :must_carry_mens_or_womens_apparel
  
  def must_carry_mens_or_womens_apparel
    if !(mens_apparel == true || womens_apparel == true)
      errors.add(:base, "Store must carry at least one of men's or women's")
    end
  end
end
