class Array

  def my_each
    self.size.times do |index|
      yield(self[index])
    end
    self
  end


  def my_map
    output = []
    my_each do |value|
      output << yield(value)
    end
    output
  end


  def my_select
    output = []
    my_each do |value|
      output << value if yield(value)
    end
    output
  end

end