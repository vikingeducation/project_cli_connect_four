require 'pry'
class ComputerPlayer

  #private 

  def almost_win_horizontal?(current_player_piece, board)
    board.each_with_index do |row, row_index|
      position_index = 0
      while position_index <= 4
        if row[position_index..(position_index + 3)].count('B') == 3
          return (position_index + row[position_index..(position_index + 3)].index('-')) + 1
        end 
      position_index += 1
      end 
    end
    false
  end
  
  def almost_win_vertical?(current_player_piece, board)
    board.transpose.each_with_index do |row, row_index|
      count = 0
      row.each_with_index do |position, position_index|
        if position == current_player_piece
          count += 1
          return row_index + 1 if count == 3
        elsif position == '-' && row[position_index + 1] == current_player_piece
          next
        else
          count = 0
        end
      end
    end
    false
  end

  def almost_win_diagonal?(current_player_piece, diagonals, board)
    diagonals.each_with_index do |diagonal, diagonal_index|
      position_index = 0
      while position_index <= diagonal.length - 4
        
        if diagonal[position_index..position_index + 3].count('B') == 3

          blank_space = 
            (DIAGONAL_COORDINATES[diagonal_index][position_index + 
            diagonal[position_index..(position_index + 3)].index('-')]).divmod(10)

          if (blank_space[0] == 6 || board[blank_space[0] + 1][blank_space[1]] != '-') 
            return blank_space[1] + 1
          end
        end 
      position_index += 1
      end 
    end
    false
  end

  def almost_win?(current_player_piece, board, diagonals)
    almost_win_horizontal?(current_player_piece, board) ||
    almost_win_vertical?(current_player_piece, board) ||
    almost_win_diagonal?(current_player_piece, diagonals, board)
  end

  public

  def make_move(current_player_piece, board, diagonals)
    if almost_win?(current_player_piece, board, diagonals)
      sleep 0.5
      almost_win?(current_player_piece, board, diagonals)
    else
      sleep 0.5
      (1..7).to_a.sample
    end
  end
end