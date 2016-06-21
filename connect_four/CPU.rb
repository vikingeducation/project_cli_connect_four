require 'pry'

class CPU < Player

		# the CPU will be generated only if 1 player is selected
		# the CPU will be able to evaluate the board
	def evaluate_board
		# check for 3 in a row of its color
		# check rows
		# check columns
		# check diagonal
		# if no options
		# place where 1 or 2 of CPU color
  end



	# CPU will generate a move
  def generate_move

  	return rand(1..7)

  end

  def ask_for_move

  	generate_move

  end

  def get_move

  	super

  end




end