require 'pry'

class CPU < Player

		# the CPU will be generated only if 1 player is selected
		# the CPU will be able to evaluate the board
	def evaluate_board

    # need to start with a column that sends a piece to the row, column and diagonal
    column_to_try = 1

    until column_to_try == 8

      if @board.column_has_room?( column_to_try )
        @board.drop_piece( column_to_try, @piece )

        if @board.victory?( @piece )
          @board.remove_piece( column_to_try, @piece )
          return column_to_try
        else
          @board.remove_piece( column_to_try, @piece )

        end

      end

      column_to_try += 1

    end

    return rand(1..7)

  end


	# CPU will generate a move
  def generate_move



  end



  def ask_for_move

    return evaluate_board

  end






end