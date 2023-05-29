class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:

hello = Hello.new
puts hello.hi # hello

hello = Hello.new
puts hello.bye # error

hello = Hello.new
puts hello.greet # error

hello = Hello.new
puts hello.greet("Goodbye") # goodbye

puts Hello.hi # error