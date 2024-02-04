=begin
challenge: U3 - ActiveRecord
creater: @Jiajia Yang
create data: 2024-02-04
update data: 2024-02-04
description: Active record Coding Challenge
=end
require 'faker'

#find all categories in the database
categories = Category.includes(:products).all #includes products to avoid N+1 query problem, which means it will load all products associated with each category in one query. So it will be more efficient.

#display the names of all categories and products in a formatted way
categories.each do |category|
  puts "Category: #{category.name}"

  products = category.products
  if products.empty?
    puts "  No products found."
  else
    puts "  Product-price:"

    products.each do |product|
      puts "    #{product.name} - $#{product.price}"
    end
  end

end