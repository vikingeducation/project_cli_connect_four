class Array

	def my_each
		i = 0
		while i < self.length
			yield(self[i])
			i += 1
		end
		self
	end



	def my_stuff
		self.reverse
	end


end


