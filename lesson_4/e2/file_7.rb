class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

c1 = Cat.new("big")
c2 = Cat.new("bigger")
c3 = Cat.new("biggest")
puts Cat.cats_count

# Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

# It counts how many instances of Cat have been created. Every time one is instantiated, 1 is added to the "counter"