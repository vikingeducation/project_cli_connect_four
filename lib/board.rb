class Board
	attr_reader :board_array

	def initialize( board_array = nil)
		@board_array = board_array || Array.new(6) { Array.new(3) }
	end
end