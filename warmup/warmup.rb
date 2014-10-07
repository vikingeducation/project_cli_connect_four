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
		i = 0
		while i < self.length
			marr.push(yield(self[i]))
			i += 1
		end

		# marr.push(self.my_each{ |item| self })			

		return marr
	end #my_map	

	def my_select
		sarr = []
		i = 0
		while i < self.length
			if yield(self[i])
				sarr.push(self[i])
				i += 1
			else
				i += 1
			end
		end

		return sarr
	end


end


