require 'pry'

class CPU < Player


  def ask_for_move

    return evaluate_board

  end


#private

  def evaluate_board

    # CPU goes through each column to test for a win and returns that column for its move if a winning placement
    column_to_try = 1

    until column_to_try == 8

      if @board.column_has_room?( column_to_try )

        @board.drop_piece( column_to_try, @piece )

        if @board.victory?( @piece )

          # remove the piece before sending the move
          @board.remove_piece( column_to_try, @piece )

          return column_to_try

        else

          # removes the non-winning drop to try a new one
          @board.remove_piece( column_to_try, @piece )

        end

      end

      column_to_try += 1

    end

    return rand(1..7)

  end



end