=begin
challenge: U3 - ActiveRecord
creater: @Jiajia Yang
create data: 2024-02-04
update data: 2024-02-04
description: Active record Coding Challenge
=end
require 'faker'
# require 'activerecord-import'

# categories = []
# products = []

#user faker to generate 10 new categories and 10 products for each category
10.times do
#category
  category = Category.new(name: Faker::Commerce.department)
  puts "category name:#{category.name}"
  # categories << category
  category.save


  #generate 10 products for each category
  10.times do
    Product.new(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price(range: 0.01..100.0),
      stock_quantity: Faker::Number.between(from: 1, to: 100),
      category_id: category.id)

    puts "product name:#{product.name}"
    # products << product
    product.save
  end

end

# # Bulk insert categories
# Category.import categories

# Product.import products

# puts "Categories and products have been imported."
