# Your code here!

class Array

  def my_each
    i = 0
    while (i < self.size)
      yield(self[i])
      i += 1
    end
    self
  end

  def my_map
    i = 0
    mapped_array = []
    while (i < self.size)
      mapped_array << yield(self[i])
      i += 1
    end
    mapped_array
  end

  def my_select
    i = 0
    selected_items = []
    while (i < self.size)
      if yield self[i]
        selected_items << self[i]
      end
      i += 1
    end
    selected_items
  end
end


# Testing my_each
#my_proc = Proc.new {|item| puts item}
#[1,2,5].my_each(&my_proc)

# array_of_squares = [1,2,5].my_map do |item|
#  item ** 2
# end

# my_proc = Proc.new {|item| item** 2}
#array_of_squares = [1,2,5].my_map(&my_proc)
# puts array_of_squares

# my_proc = Proc.new{|item| item.odd?}
# saved_array = [1,2,5].my_select(&my_proc)
# puts saved_array