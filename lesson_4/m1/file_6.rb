class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template #accesses template without using self (recommended)
  end
end

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    self.template #calls accessor method on self
  end
end