class Array

  def my_each
    index = 0

    while index <= self.length-1
      yield(self[index])
      index += 1
    end

    self
  end

  def my_map(proc=nil)
    duplicate = []

    self.my_each do |x|
      if block_given?
        duplicate << yield(x)
      elsif proc

      else

      end
    end

    duplicate
  end

  def my_select
    selected_array = []

    self.my_each do |x|
      if yield(x)
        selected_array << x
      end
    end

    selected_array
  end

end

array = ['Elephant', 'Lion', 'Gazelle']

array.my_each { |x| puts x }
puts array.my_map { |x| x.upcase }
puts array.my_select { |x| x == 'Elephant' }