class Employee < ActiveRecord::Base
  belongs_to :store

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_numericality_of :hourly_rate,
    only_integer: true,
    greater_than_or_equal_to: 40,
    less_than_or_equal_to: 200
  validates_presence_of :store_id,
    only_integer: true
  
  # before_create :assign_password_before_create
  after_create :assign_password_after_create

  private

  def assign_password_before_create
    self.password = generate_random_password(8)
  end
  
  def assign_password_after_create
    self.password = generate_random_password(8)
    self.save
  end

  def generate_random_password(length)
    # Generate a random string using [a-z, 0-9]
    rand(36**length).to_s(36)
  end
end
