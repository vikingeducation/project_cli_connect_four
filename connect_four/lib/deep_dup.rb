class Array

	def deep_dup
		new_arr = deep_dup_recursive self.dup
	end

	def deep_dup_recursive (array_to_dup)
		if array_to_dup.any? { |item| item.is_a?(Array)}
			array_duped = array_to_dup.dup
			array_duped.each_with_index do |item, index|
				if item.is_a? (Array)
					array_duped[index] = deep_dup_recursive array_duped[index]
				end
			end
			array_duped
		else
			array_duped = array_to_dup.dup
		end
	end
end