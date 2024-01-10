=begin
challenge: U0 - Challenge Zero (A New Beginning)
creater: @Jiajia Yang
data: 2024-01-09
description: Ultimate Challenge Zero
=end


# #1)Write a Ruby program to calculate the after tax value of a specific dollar amount.
# sub_total = 5.00
# GST_RATE = 0.05
# PST_RATE = 0.07
# grand_total = sub_total * (1 + GST_RATE + PST_RATE)

# puts "Subtotal: $#{sub_total}"
# puts "PST: $#{sub_total * PST_RATE} - #{PST_RATE * 100}%" # 5.00 * 0.07 = 0.35
# puts "GST: $#{sub_total * GST_RATE} - #{GST_RATE * 100}%" # 5.00 * 0.05 = 0.25
# puts "Grand Total: $#{grand_total}" # 5.00 * (1 + 0.05 + 0.07) = 5.00 * 1.12 = 5.60


# #2)Update your Ruby program from question one such that it prints a short message after the grand total.
# #If the grand total is equal to or less than $5.00 then message should be: "Pocket Change"
# #If the grand total is greater than $5.00 but less than $20 the message should be: "Wallet Time"
# #If the grand total is equal to or greater than $20 the message should be: "Charge It!
# if grand_total <= 5.00
#   puts "Pocket Change"
# elsif grand_total > 5.00 && grand_total < 20.00
#   puts "Wallet Time"
# else
#   puts "Charge It!"
# end


# #3)Do some research online to figure out how to read keyboard input from Ruby
# #and how to convert strings into floats.
# print 'Enter a subtotal number: '
# input = gets.chomp
# float_number = input.to_f
# puts "The float value is #{float_number}"

#update :

GST_RATE = 0.05
PST_RATE = 0.07

def sub_total input_number
  sub_total = input_number
  # %.2f means float number with 2 decimal places
  # .round means round the number to the nearest integer
  puts "Subtotal: $#{'%.2f' % sub_total}"
  puts "PST: $#{'%.2f' % (sub_total * PST_RATE)} - #{(PST_RATE * 100).round}%" # 5.00 * 0.07 = 0.35
  puts "GST: $#{'%.2f' % (sub_total * GST_RATE)} - #{(GST_RATE * 100).round}%" # 5.00 * 0.05 = 0.25

  grand_total = sub_total * (1 + GST_RATE + PST_RATE)
  puts "Grand Total: $#{'%.2f' % grand_total}" # 5.00 * (1 + 0.05 + 0.07) = 5.00 * 1.12 = 5.60

  if grand_total <= 5.00
    puts "Pocket Change"
  elsif grand_total > 5.00 && grand_total < 20.00
    puts "Wallet Time"
  else
    puts "Charge It!"
  end

end

def input_subtotal
  print 'Enter a subtotal number: '
  input = gets.chomp
  input_number = input.to_f
  # Regex to check if the string is a valid float
  if input.match(/\A-?\d+(\.\d+)?\z/)
    input_number = input.to_f
    sub_total(input_number)
  else
    puts "Please input a float number"
    input_subtotal
  end
end

input_subtotal





