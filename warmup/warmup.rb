# Create my_each method, add to Array class
class Array
	def my_each
		0.upto(self.length-1) do |index|
			# I want to leave the functionality
			# up to the user if the give a block
			if block_given?
				yield(self[index])
			else
				# Otherwise just output each item
				puts self[index]
			end
		end
		self
	end
end

