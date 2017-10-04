require 'pry'
class ComputerPlayer

  #private 

  def almost_win_horizontal?(current_player_piece, board)
    board.each_with_index do |row, row_index|
      position_index = 0
      while position_index <= 4
        if row[position_index..(position_index + 3)].count('B') == 3
          #Sbinding.pry
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

  def almost_win_diagonal?(current_player_piece, diagonals)
    diagonals.each_with_index do |diagonal, diagonal_index|
      position_index = 0
      while position_index <= 4
        if diagonal[position_index..(position_index + 3)].count('B') == 3
          #Sbinding.pry
          return (position_index + diagonal[position_index..(position_index + 3)].index('-')) + 1
        end 
      position_index += 1
      end 
    end
    false
  end

  def almost_win?(current_player_piece, board, diagonals)
    almost_win_horizontal?(current_player_piece, board) ||
    almost_win_vertical?(current_player_piece, board) ||
    almost_win_diagonal?(current_player_piece, diagonals)
  end

  public

  def make_move(current_player_piece, board, diagonals)
    if almost_win?(current_player_piece, board, diagonals)
      almost_win?(current_player_piece, board, diagonals)
    else
      sleep 1
      (1..7).to_a.sample
    end
  end
end