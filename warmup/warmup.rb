class Array
<<<<<<< HEAD
	def my_each
		i = 0
		while i < self.length
			yield self[i]
			i += 1
		end
		self		
	end

	def my_map
		result = []
		self.my_each do |i|
			result << yield(i)
		end
		result
	end

	def my_select
		result = []
		self.my_each do |i|
		result << i if yield(i)
		end
		result
	end
end

=======
  def my_each
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    self    
  end

  def my_map
    result = []
    self.my_each do |i|
      result << yield(i)
    end
    result
  end

  def my_select
    result = []
    self.my_each do |i|
    result << i if yield(i)
    end
    result
  end
end
>>>>>>> bf71fbc40f3777cb6a60459664767e956d7accb2
