require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

# Your code goes here ...
# 1. Output the total revenue for the entire company (all stores), using Active Record's `.sum` calculation method.
# 2. On the next line, also output the average annual revenue for all stores.
# 3. Output the number of stores that are generating $1M or more in annual sales. **Hint:** Chain together `where` and `size` (or `count`) Active Record methods.

@total_revenue = Store.all.sum(:annual_revenue)
@average_revenue = @total_revenue / Store.count
@number_1m_earners = Store.where("annual_revenue >= 1000000").count

puts "Total revenue: #{@total_revenue}"
puts "Average revenue: #{@average_revenue}"
puts "#{@number_1m_earners} stores generating over $1M"