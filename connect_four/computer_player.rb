require_relative 'board'
class ComputerPlayer
  def almost_win_horizontal?(current_player_piece, board)
    board.each_with_index do |row, row_index|
      count = 0
      row.each do |position|
        if position == current_player_piece
          count += 1
          return row_index + 1 if count == 3
        else
          count = 0
        end
      end
    end
    false
  end
  def almost_win_vertical?(current_player_piece, board)
    board.transpose.each_with_index do |row, row_index|
      count = 0
      row.each do |position|
        if position == current_player_piece
          count += 1
          return row_index + 1 if count == 3
        else
          count = 0
        end
      end
    end
    false
  end

  def almost_win_diagonal?(current_player_piece, baord)
    @diagonals.each do |diagonal|
      count = 0
      diagonal.each do |position|
        if position == current_player_piece
          count += 1
          return row_index + 1 if count == 3
        else
         count = 0
        end
      end
    end
    false
  end

  def almost_win?
    almost_win_horizontal?(current_player_piece, board) ||
    almost_win_vertical?(current_player_piece, board) ||
    almost_win_diagonal?(current_player_piece, board)
  end

  def make_move(current_player_piece, board)
    if almost_win?(current_player_piece, board)
      almost_win?(current_player_piece, board)
    else
      sleep 1
      (1..7).to_a.sample
    end
  end
end