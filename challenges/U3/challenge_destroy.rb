=begin
challenge: U3 - ActiveRecord
creater: @Jiajia Yang
create data: 2024-02-04
update data: 2024-02-05
description: Active record Coding Challenge
=end
require_relative 'ar.rb'

product_created_before = Product.find_by(name: 'Product A')

if product_created_before #if the product exists
  product_created_before.destroy
  puts 'Product A deleted successfully.'
else
  puts 'Product A not found.'
end