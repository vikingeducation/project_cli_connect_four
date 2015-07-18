# Using my_each to write out other methods
# -----------------------------------------


class Array

	def my_each
		i = 0
		while i < self.length
			yield(self[i])
			i += 1
		end
		self
	end

	def my_map
		marr = []
		self.my_each do |i|
			marr.push(yield(i))
		end		
		return marr
	end

	def my_select
		sarr = []
		self.my_each do |i|
			if yield(i)
				sarr.push(i)
			else
				next
			end
		end
		sarr
	end


end