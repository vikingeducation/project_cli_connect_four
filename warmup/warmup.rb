class Array
  def my_each(arr)
      i = 0
      while i < arr.size
          yield(arr[i])
          i+=1
      end 
      arr
  end

  def my_map(arr,act)
      i = 0
      while i < arr.size
          yield(act(arr[i]))
          i+=1
      end 
      arr
  end

  def my_select(arr,criteria)
      arr.my_each { |element|  element.criteria ? : yield(element) nil}
  end 

end
