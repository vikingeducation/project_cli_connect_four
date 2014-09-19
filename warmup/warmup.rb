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

end


