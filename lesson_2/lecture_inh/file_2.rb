class Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
	def fetch
    'fetching!'
  end

	def swim
    'swimming!'
  end
	
	def speak
    'bark!'
  end
end

class Bulldog < Dog
	def swim
		"can't swim!"
	end
end

class Cat < Animal
	def speak
    'meow'
  end
end

kitty = Cat.new
doggo = Dog.new

puts doggo.fetch
puts kitty.fetch