class Person
  attr_accessor :name  #this said reader, not accessor
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"