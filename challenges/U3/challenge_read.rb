=begin
challenge: U3 - ActiveRecord
creater: @Jiajia Yang
create data: 2024-02-04
update data: 2024-02-04
description: Active record Coding Challenge
=end
require_relative 'ar.rb'

#Use the Product class to find (any) product from the database
product = Product.first

#Inspect the Product object you have retrieved
puts product.inspect

#record all the columns that exist in the products table
puts Product.column_names
#based on the columns we can see products table has an association with the categories table, because it has a category_id column.

#Total number of products
number_of_products = Product.count
puts "There are #{number_of_products} in the products table."

#The names of all products above $10 with names that begin with the letter C
products_above_10_with_C = Product.where("price > 10").where("name LIKE 'C%'").pluck(:name)
puts "The names of all products above $10 with names that begin with the letter C are: \n#{products_above_10_with_C.join("\n")}"

#Total number of products with a low stock quantity. (Low is defined as less than 5 in stock.)
products_with_low_stock_number = Product.where("stock_quantity < 5").count
puts "There are #{products_with_low_stock_number} products with a low stock quantity."



#Find the name of the category associated with one of the products you have found.
product = Product.first # or Product.find(id) to find a specific product
category_name = product.category.name
puts "Category Name: #{category_name}"

# create a new procuct belongs to the above category
category = Category.find_by(name: category_name)
new_product = Product.new(name: 'Product with category', description: 'This is product with category', price: 20, stock_quantity: 10, category: category)
if new_product.save
  puts 'Product with category created successfully.'
else
  puts 'Product with category not created.'
end

# find all products reference to the category which price over than 10
products_price_over_10 = category.products.where("price > 10").pluck(:name)
puts "The names of all products reference to the category which price over than 10 are: \n#{products_price_over_10.join("\n")}"