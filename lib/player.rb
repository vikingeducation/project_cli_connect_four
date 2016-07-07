class Player
	attr_accessor :name, :piece

	def initialize(name = "Temp Name",piece,board)
		@name = name
		@piece = piece
		@board = board
	end
end