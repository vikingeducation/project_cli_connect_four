class CPU < Player


	# the CPU will be generated only if 1 player is selected
	# the CPU will be able to evaluate the board
	def evaluate_board
	# check for 3 in a row of its color
	# if no options
	# place where 1 or 2 of CPU color
  end

  def generate_move

  	return rand(1..7)

  end



  def get_move

			column = generate_move

			super (column)


  end


	# CPU will generate a move
	# move will need to be validated?
	# or set boundries in advance



end