module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
  puts self.ancestors
end

class HotSauce
  include Taste
  puts self.ancestors
end

# What is the lookup chain for Orange and HotSauce?
# Orange/HotSauce, Taste, Object, Kernel, BasicObject