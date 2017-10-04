class HumanPlayer 
  def make_move(current_player_piece, board, diagonals)
    @column = gets.chomp.to_i
    validate_move(current_player_piece, board, diagonals)
  end

  def validate_move(current_player_piece, board, diagonals)
    until (1..7).include?(@column)
      puts "Out of bounds. Please select a number between 1 and 7."
      make_move(current_player_piece, board, diagonals)
    end
    @column
  end 
end