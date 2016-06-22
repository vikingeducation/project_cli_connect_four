require 'pry'

class CPU < Player

		# the CPU will be generated only if 1 player is selected
		# the CPU will be able to evaluate the board
	def evaluate_board
		# want to place next to own piece
		# or to win
		#three_pieces = @piece.to_s * 3
		#row_arr = @board.board_as_string_row
		#binding.pry
		# check for 3 in a row of its color
		# check rows
		row = @board.board.join
		column = @board.board_as_string_col

		if column.include?( @piece.to_s * 3 )

			return move_for_column_win( column )

		else
			return rand(1..7)
		end

		diag = @board.board_as_string_diagonal
		# check columns
		# check diagonal
		# if no options
		# place where 1 or 2 of CPU color
		# eval the entire array?
		# check for 3 of the CPU's piece
		#return column

  end

  def move_for_column_win( string )

  	# split the string to resemble index = column number
  	col_arr = string.split("-")

  	col_arr.each_with_index do | x, i |

  		if x.include?( @piece.to_s * 3 )

  			return i

  		end

  	end


  end


  def place_win



  end


	# CPU will generate a move
  def generate_move

  	return evaluate_board
  	#return rand(1..7)

  end

  def ask_for_move

  	generate_move

  end

  def get_move

  	super

  end




end