=begin
challenge: U3 - ActiveRecord
creater: @Jiajia Yang
create data: 2024-02-04
update data: 2024-02-05
description: Active record Coding Challenge
=end
require_relative 'ar.rb'

product1 = Product.new(name: 'Product A', price: 100, description:"1kg per bag", stock_quantity: 10)
if product1.save
  puts 'Product 1 saved successfully.'
else
  puts product1.errors.full_messages
end


product2 = Product.create(name: 'Product B', price: 200,description:"2kg per bag", stock_quantity: 20)
if product2.persisted?
  puts 'Product 2 saved successfully.'
else
  puts product2.errors.full_messages
end


product3 = Product.find_or_create_by(name: 'Product C') do |product|
  product.price = 300
  product.description = "3kg per bag"
  product.stock_quantity = 30
end

if product3.persisted?
  puts 'Product 3 saved successfully.'
else
  puts product3.errors.full_messages
end

#miss the description column
product4 = Product.new(name: 'Incomplete Product', price: 100, stock_quantity: 10)
if product4.save
  puts 'Product 4 saved successfully.'
else
  puts product4.errors.full_messages
  # product.errors.full_messages.each do |message|
  #   puts message
  # end

end




