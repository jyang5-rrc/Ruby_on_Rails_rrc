puts "Hello World"


#Constants
NUMBER_OF_ARMS = 2

#Variables
temperature_on_mars = -5
puts temperature_on_mars * 2

#Strings
opening_line = 'It was the best of times.'
movie_trailer = "In a land that time forgot, "
opening_line = opening_line + " It was the blurst of times."
movie_trailer += 'there grew a ninja '
movie_trailer += "who would never be forgotten."

#Expression Interpolation
time = "4 o'clock"
state_of_town = "all is well"
town_crier = "It's " + time + " and " + state_of_town + "."
# or we can do
town_crier = "It's #{time} and #{state_of_town}."

#Numbers - Integers
very_large_number = 34_000_000_001
even_larger_number = very_large_number * 12_345
puts "Whoa #{even_larger_number} is a large number!"

#Numbers - Floats--constants
ALMOST_PI = 3.14
AVOGADROS_CONSTANT = 6.02214179e23

#range
(1..5).each {x}

# method
def say_goodnight(name)
  puts "Good Night, #{name}"

end

say_goodnight('Jhon Boy')
say_goodnight('Jocelyn Yang')

def square(x)
  x*x
end

def share_pizza(pieces_left,people)
  if(pieces_left < people)
    "Sorry I don't have enough pizza"
  else
    "Let's share. Any leftovers go to the dog."
  end
end

puts square(5) # get the last result
puts share_pizza(4,3) # get the string.

#Nil is no
# the varialbe is existing , but it is empty.
# give error said clown_car is not defined.
if(clown_car == nil)
  puts 'where are all the clowns?'
end

#True and False
if (0)
puts 'Zero is true!'
end
empty_string = ''
if (empty_string)
puts 'An empty string is true!'
end

#Boolean Expressions
#Symbol Meaning
#== equal
#!= not equal
#> greater than
#< less than
#>= greater than or equal
#<= less than or equal
#&& Boolean ‘and’
#¦¦ Boolean ‘or’

# if can write like :
puts 'Great Scott!' if speed_of _delorean >88

#elseif
if(temperature <0)
  clothing = 'snowsuit'
elsif (temperature >0)
  clothing = 'normal'
end

#unless--the logical inverse
unless x<=5
  puts 'x is larger than5'
else
  puts 'sadly'
end

unless temperature < 0
  puts 'Let us go for a stroll.'
  end
# same with if:
if !(temperature < 0) # Better written as the equivalent: if temperature >= 0
  puts 'Let us go for a stroll.'
end

#modifier:
snow_fort = 'awesome' unless temperature >0

#case
number =4
case number
when 1 # when number equal to 1
  puts '1'
when 2
  puts '2'
when 3..10
  puts "it's a tea party"
else
  puts "none"
end

#Case Statment With Expressions
enlightenment = 42
case
when enlightenment > 60
puts 'You are too hasty, grasshopper.'
when (enlightenment < 40 || enlightenment == nil)
puts 'You are like the sloth, my friend. Diligence is key!'
when enlightenment == 42
puts 'Hello, Enlightened One.'
else
  puts 'Yeah, not quite, pal. Maybe next time.'
end

#Blocks {}
42.times {puts 'forty two'}
#If your block is longer than one line it’s common practice to replace the curly braces with do and end :
#In a sense you can think of blocks as being unnamed methods, like anonymous functions in Javascript.
42.times do
  puts 'Forty two'
  puts 'Wiggle'
end

#Block Arguments
# The times method takes a block as its argument.
#if this block accepts an argument then times will provide it with the current value of its iteration counter
42.times { |i| puts "#{i} is the meaning of life, the universe, and everything." }
#output:
#0 is the meaning of life, the universe, and everything.
#1 is the meaning of life, the universe, and everything.
#2 is the meaning of life, the universe, and everything.
#<skip a few >
#41 is the meaning of life, the universe, and everything.

#Block arguments are a set of variables surrounded by pipe characters and separated by commas.
{|x,y|x+y}
#same：
do |x,y|
  x+y
end


#Traversing Arrays--Loop
#the each method takes a block as an argument.
ghosts = %w[Blinky Pinky Inky Clyde]
ghosts.each do |ghost_name|#ghost_name is the value of the array
puts ghost_name
end

#We could also have use a curly-brace style block:
ghosts.each { |ghost_name| puts ghost_name }


#Indexed Each Loops
ghosts = %w[Blinky Pinky Inky Clyde]
ghosts.each_index do |i| # i is the each_index of the array, same as the number times of the each run.
puts "#{i}: #{ghosts[i]}"
end
#0: Blinky
#1: Pinky
#2: Inky
#3: Clyde


#Traversing Hashes字符串
ghost_dictionary = { 'Blinky' => 'Shadow',
'Pinky' => 'Speedy',
'Inky' => 'Bashful',
'Clyde' => 'Pokey' }
ghost_dictionary.each do | nickname, character |
puts "#{nickname} also know as #{character}."
end
#Output:
#Blinky also know as Shadow.
#Pinky also know as Speedy.
#Inky also know as Bashful.
#Clyde also know as Pokey.


#A Map is a Conversion Loop
secrets = ["eht", "tsohg", "lliw", "ekirts", "ta", "thgindim"]
decoded = secrets.map { |word| word.reverse }#reverse is a method of string of ruby
# decoded equals:["the", "ghost", "will", "strike", "at", "midnight"]
#*Map takes a block, passes each array element into that block, and produces a second array based on the block’s return value.

COMBINED_TAX_RATE = 0.11 # 11%
product_prices = [12.34, 839.00, 90.95, 100]
product_taxes = product_prices.map { |price| price * COMBINED_TAX_RATE }
# product_taxes equals: [1.3574, 92.29, 10.0045, 11.0]

#We Can Reduce Collections Too
#Sometimes we want to reduce a collection down to a single value:
product_prices = [12.34, 839.00, 90.95, 100]
total_price = product_prices.sum
max_price = product_prices.max
min_price = product_prices.min

#The reduce method lets us write customer reducers. Here’s sum rewritten as a reduce :
product_prices = [12.34, 839.00, 90.95, 100]
total_price = product_prices.reduce(0) { |sum, price| sum + price }
#reduce is a method in Ruby that is used to accumulate a value across the elements of an array. It takes an initial value and a block. The initial value here is 0.
#The block { |sum, price| sum + price } takes two parameters - sum and price. For each element in the product_prices array, the block is executed, adding the current element (price) to the accumulator (sum).
# If your reduce block involves a single operator like this it can be refactored to:
total_price = product_prices.reduce(:+)

#We can also reduce hashes, by first grabbing only the values:
toys_and_prices = { lego: 120.30, doll: 30.23, catan: 40.55 }
total_price = toys_and_prices.values.reduce(:+)


#Scope
#Scope and Methods

# How many legs are there in total if we have
# 'creature_count' number of 'creature's?
def leg_count creature, creature_count
  if creature == 'human'
    legs = 2 * creature_count
  elsif creature == 'spider'
    legs = 8 * creature_count
  else
    legs = 4 * creature_count
  end
  "#{legs} #{creature} legs in total."
end
puts leg_count 'spider', 4
puts legs # This variable should not be available in the current scope.
#output:
#32 spider legs in total.
#NameError:undefined local variable or method `legs' for main:Object (NameError)


#Scope and Blocks
#Block parameters (like fruit in do |fruit|) are always local to the block. Even if there's an existing variable with the same name outside the block, the block parameter will create a new, separate scope.
fruit = 'dragon fruit' # The fruit variable *will not* be overwritten by the loop.
double_fruit = fruit * 2 # The double_fruit variable *will* be overwritten by the loop.
['apple','pear','banana'].each do |fruit| # Creates a second fruit variable with a separate scope.
double_fruit = fruit * 2 # double_fruit refers to the variable defined above the block.
puts "I ate one #{fruit}. Doubled: #{double_fruit}"
end
puts "It's true I ate one #{fruit}." # Still 'dragon fruit'
puts "But the double fruit is #{double_fruit}!" # 'bananabanana'
#Output:
#I ate one apple. Doubled: appleapple
#I ate one pear. Doubled: pearpear
# I ate one banana. Doubled: bananabanana
# It's true I ate one dragon fruit.
# But the double fruit is bananabanana!




