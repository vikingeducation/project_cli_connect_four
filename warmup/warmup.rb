class Array

  def my_each(proc=nil)
    index = 0

    while index <= self.length - 1
      block_given? ? yield(self[index]) : proc.call(self[index])
      index += 1
    end

    self
  end

  def my_map(proc=nil)
    duplicate = []

    self.my_each {|x| proc ? duplicate << proc.call(x) : duplicate << yield(x) }

    duplicate
  end

  def my_select(proc=nil)
    selected_array = []

    #HORRIBLE/AWESOME
    self.my_each { |x| proc ? (selected_array << x if proc.call(x)) : (selected_array << x if yield(x)) }

    selected_array
  end

end

array = ['Elephant', 'Lion', 'Gazelle']

puts_proc = Proc.new { |x| puts x }
upcase_proc = Proc.new { |x| x.upcase }
elephant_proc = Proc.new { |x| x == 'Elephant' }

array.my_each { |x| puts x }
puts array.my_map { |x| x.upcase }
puts array.my_select { |x| x == 'Elephant' }
puts "-----------"
array.my_each(&puts_proc)
puts array.my_map(&upcase_proc)
puts array.my_select(&elephant_proc)


# OUTPUT
#
# Elephant
# Lion
# Gazelle
# ELEPHANT
# LION
# GAZELLE
# Elephant
# -----------
# Elephant
# Lion
# Gazelle
# ELEPHANT
# LION
# GAZELLE
# Elephant