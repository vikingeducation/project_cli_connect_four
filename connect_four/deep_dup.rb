class Array

	def deep_dup
		new_arr = deep_dub_recursive self.dup
	end

	def deep_dub_recursive (array_to_dup)
		if array_to_dup.any? { |item| item.is_a?(Array)}
			array_duped = array_to_dup.dup
			array_duped.each_with_index do |item, index|
				if item.is_a? (Array)
					array_duped[index] = deep_dub_recursive array_duped[index]
				end
			end
			array_duped
		else
			array_duped = array_to_dup.dup
			array_duped
		end
	end
end