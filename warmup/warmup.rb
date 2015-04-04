class Array
  
  def my_each
    self.each_with_index do |element, index|
      yield( self[index] )
    end
    self
  end
  
  def my_map
    mapped_arr = []
    self.each_with_index do |element, index|
      mapped_arr << yield( self[index] )
    end
    mapped_arr
  end
  
  def my_select
    selected_elements = []
    self.each_with_index do |element, index|
      if yield( self[index] )
        selected_elements << self[index]
      end
    end
    selected_elements
  end
  
end

# [1,2,5].my_each{ |item| puts item }
# my_proc = Proc.new{ |item| puts item ** 2 }
# [1,2,5].my_each(&my_proc)

# test_map = [1,2,5].my_map do |item|
#   item ** 2
# end
# puts "#{test_map}"

# my_proc = Proc.new{ |item| item.even? }
# select_test = [1,2,5].select(&my_proc)
# puts "#{select_test}"