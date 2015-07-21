class enum
  
  
  def my_each(argument = nil)
    i = 0
    while !self[i].nil? do
      if block_given?
        yield self[i]
      else
        argument.call(self[i])
      end
      i += 1
    end
    return self
  end
  
  def my_map(argument = nil)
    result = []
    self.my_each do |val|
      if block_given?
        result << yield(val)
      else
        result << argument.call(val)
      end
    end
    puts result
    return result
  end
  
  def my_select(argument = nil)
    result = []
    self.my_each do |val|
      if block_given?
        if yield(val)
          result << val
        end
      else
         if argument.call(val)
          result << val
        end
      end
    end
    return result
  end
  
  
  def my_all?(argument = nil)
    self.my_each do |val|
      if block_given?
        if !yield(val)
          return false
        end
      else
        if !argument.call(val)
          return false
        end
      end
    end
    return true
  end   
  
  def my_inject(arg = 0, argument = nil)
    result = arg
    self.my_each do |item|
      if block_given?
        result = yield(result, item)
      else
        result = argument.call(result, item)
      end
    end    
    result
  end
  
  
end