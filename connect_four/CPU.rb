class CPU

attr_accessor :name, :piece, :board

	def initialize( name = "Joe", piece, board )

		@name = name
		@piece = piece
		@board = board


	end
	# the CPU will be generated only if 1 player is selected
	# the CPU will be able to evaluate the board
	def evaluate_board
	# check for 3 in a row of its color
	# if no options
	# place where 1 or 2 of CPU color
  end

  def make_move


  end

  def get_move

  end
	# CPU will generate a move
	# move will need to be validated?
	# or set boundries in advance



end