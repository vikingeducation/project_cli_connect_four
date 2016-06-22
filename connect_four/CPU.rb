require 'pry'

class CPU < Player

		# the CPU will be generated only if 1 player is selected
		# the CPU will be able to evaluate the board
	def evaluate_board

		row = @board.board.join
		column = @board.board_as_string_col

		if column.include?( @piece.to_s * 3 )

			return move_for_column_win( column )

		elsif row.include?( @piece.to_s * 2)

			return move_for_row_win( row )

		else

			return rand(1..7)

		end


		diag = @board.board_as_string_diagonal


  end


  def move_for_row_win( string )

  	# generate 6 rows as an array
  	row_arr = string.split("]")
  	bobb = "BOBB"
  	bbob = "BBOB"
  	bb   = "BB"

  	row_arr.each_with_index do | x, i |

  		if x.include?( @piece.to_s * 3 )
  			# then need to go through that row to determine where the winning combo is based on the index = column
  			column = x.index( @piece.to_s * 3 )
  			if x[ column - 1 ] == "O"

  				# return the column before the BBB
  				return column - 1

  			else

  				# return column after the BBB
  				return column + 3

  			end
  		elsif x.include?( bbob )

  			return ( x.index( bbob ) + 2 )

  		elsif x.include?( bobb )

  			return ( x.index( bobb ) + 1 )

  		elsif x.include?( bb )

  			column = x.index( bb )
  			if x[ column - 1 ] == "O"

  				# return the column before the BBB
  				return column - 1

  			else

  				# return column after the BBB
  				return column + 2

  			end

      end

    end


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