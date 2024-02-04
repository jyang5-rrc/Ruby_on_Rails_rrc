=begin
challenge: U3 - ActiveRecord
creater: @Jiajia Yang
create data: 2024-02-04
update data: 2024-02-05
description: Active record Coding Challenge
=end
require_relative 'ar.rb'

#find all products with a stock quantity greater than 40
#add one to the stock quantity of all products with a stock quantity greater than 40
Product.where("stock_quantity > 40").find_each do |product| #find_each is used to iterate over a large number of records..each is used to iterate over a small number of records.
  product.stock_quantity += 1

  if product.save
    puts "Product #{product.name} stock quantity updated successfully."
  else
    puts "Failed to update product #{product.name} stock quantity. #{product.errors.full_messages}"
  end
end


