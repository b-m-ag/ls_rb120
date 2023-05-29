class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer # error
tv.model # model

Television.manufacturer # manufacturer
Television.model # error