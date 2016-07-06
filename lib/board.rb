class Board
	attr_reader :board_array

	def initialize( board_array = nil)
		@board_array = board_array || Array.new(6) { Array.new(7) }
	end

	def render
		puts
		@board_array.each do |row|
			row.each do |column|
				column.nil? ? print("-") : print(column.to_s)
			end
			puts
		end
	end
end