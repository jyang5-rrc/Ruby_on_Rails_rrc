#1. Class Creation
class Student < Object
end
#Note: Class names are capitalized
#Note 2: The student class is empty.
#The “< Object” indicates that our class inherits from (is a child of) the Object class.student 是object 的子类。
#student class could be re-written as:
class Student
end
#All classes inherit from the Object class when no other inheritance is specified.

#2. Class Methods and Instantiation
class Student # class name , captial letter
  def write_code #function/method
    puts "All this hacking is making me thirsty."
  end
end

a_student = Student.new # Check it out: Instantiation -object
a_student.write_code # call the method which belong to the class

#Output：All this hacking is making me thirsty.

#3.Instance Variables
#Instance variables are used to save the state of an object
#prefixed with an @ symbol
#Instance variables are “private” members by default.
class Zombie
  def greetings
    @name = "Wally Glutton" #@name is instance variables
    puts "#{@name} want Brainz!"
  end
  def name # A 'getter' method.
    @name # Returns the value of this instance variable.
  end
end

walter = Zombie.new
walter.greetings # ***have to call greeting then call name, otherwise the name will be empty.
puts walter.name

#Output:
#Wally Glutton want Brainz!
#Wally Glutton

#$Note that you do not need to predefine an instance variable before it is used.


#4. The Initialize Method
# add a constructor to our class:
class Student
  # All constructors are named 'initialize'.
  def initialize(name, student_number)
    # Save the arguments as an instance variables.
    @name = name
    @student_number = student_number
    puts "#{@name} at your service."
  end
end

wally_glutton = Student.new("Wally Glutton",8273633)

#Output:Wally Glutton at your service.

#Want to see something wild:
#Classes can be “re-opened” and added to at any time.
class Hal
  def sing
    puts "Daisy, Daisy, over the ocean blue..."
  end
end

print "hal_one sez: "
hal_one = Hal.new
hal_one.sing
#Output: hal_one sez: Daisy, Daisy, over the ocean blue...

class Hal
  def initialize
    puts "Hello Dave. Do you want to hear a song?"
  end
end

print "hal_two sez: "
hal_two = Hal.new #hal_two is a new object of Hal class, both of the function will be called.
hal_two.sing
#Output:
#hal_two sez: Hello Dave. Do you want to hear a song?
#Daisy, Daisy, over the ocean blue...


#5. Getters
class Student
  def initialize(name)
    @name = name
  end
  def name
    @name
  end
end

bobby = Student.new("Bobby Buttons") #the prameter is for initialize method
puts bobby.name

#Output: Bobby Buttons

#6. Setters
class Student
  #constructor
  def initialize(name, student_number)
    @name = name
    @student_number = student_number
  end
  #setter
  def name=(new_name)
    @name = new_name
  end
  #getter
  def name
    @name
  end
end
jimbo = Student.new("Jimbo Jimmerson",92373673)
jimbo.name = "Jimmy Jimmerson"
puts jimbo.name

#Output: Jimmy Jimmerson

#7. Get Set Shortcuts
#create getters and setters for the @name instance variable:
attr_accessor :name
#Example:
class Student
  #constructor
  def initialize(name, password, gpa)
    @name = name
    @password = password
    @gpa = gpa
  end
  attr_accessor :name # create getter and setter methods
  attr_reader :gpa # create getter only
  attr_writer :password # create setter only
end
a_student = Student.new("Wally Glutton",337392,3.5)
puts "Student name: " + a_student.name
a_student.name = "Kilgor Trout"
puts "Student name after setter: " + a_student.name
a_student.password = "gorgonzola77"
puts "Student Password: " + a_student.password

#Output:
#Student name: Wally Glutton
#Student name after setter: Kilgor Trout
#Student Password: gorgonzola77

#8.Access Control
#By default all class methods are public.
#We can also make private and protected methods.
class Student
  protected
  def secret_student_handshake # method will only be available to instances of the Student class (as well as to instances of any class that is derived from the Student class)
    # How the heck do I code a handshake?
  end
end
#Private methods are created in the same way. Private methods of a specific object are only available within that specific object.

#9.Class Scope ‘Things’
#9.1 class constants
class Student
  Location = "Red River College" # Class Constant
  #constructor
  def initialize(name, student_number, gpa)
    @name = name
    @student_number = student_number
    @gpa = gpa
  end
  #getter
  def name_and_location
    @name + "is enrolled at " + Location
  end
end
wally = Student.new("Wally Glutton",3837293,3.52)
puts wally.name_and_location
#Output: Wally Gluttonis enrolled at Red River College

#9.2 class methods
#Class level methods are often called “static” methods in other languages.
class Student
  def initialize(name, student_number, gpa)
    @name = name
    @student_number = student_number
    @gpa = gpa
  end

  # Class methods are always defined as self.method_name
  def self.generic_student
    new("Generic Student", 0, 0)
  end
end
#Here we’ve created a class level factory method that returns as generic Student object. Ruby doesn’t
#have constructor overloading but class methods like this can serve the same purpose
#You do not need an object instance of a class to execute a class method as they are called by way of the class itself:
generic = Student.generic_student # call the class method without new object instance, because it has been defined as self.method_name
puts generic.class
#output: Student

#9.3 sub-class
class Mammal
  def eat
    puts "Mmmmmmm Yum Yum"
  end
end

class Dog < Mammal # Dog inherits from Mammal
  def speak
    puts "woof woof"
  end
end

fido = Dog.new
fido.speak # This method is specific to the Dog class.
fido.eat # This method was inherited from the Mammal class.
puts "Fido is a #{fido.class}."
puts "Fido is also a Mammal." if fido.is_a?(Mammal)

#Output: woof woof
#Mmmmmmm Yum Yum
#Fido is a Dog.
#Fido is also a Mammal.

#If a child class wants to hand-off details to its parent’s constructor we use the super method:
class Mammal
  def initialize(name) # Constructor with a single argument.
    @name = name
  end
end

class Dog < Mammal # Dog inherits from Mammal
  def initialize(name, number_of_ears) # Constructor with two arguments.
    super(name) # Call the single argument Mammal constructor to allow the parent to set the @name variable.
    @number_of_ears = number_of_ears
  end
end