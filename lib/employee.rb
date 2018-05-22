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
end
