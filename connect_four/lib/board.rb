
class Board

  attr_reader :board

  def initialize
    @board = Array.new(6) {Array.new(7)}
  end

  def display_board 
    @board.each {|row| p row}
  end

  def horizontal_win?(piece, col)
    move_row = @board.length - @board.map { |row| row[col] }.compact.length
    entire_row = @board[move_row]
    entire_row.map { |el| el == nil ? 0 : el }.join().include?(piece.to_s * 4)
  end


  def vertical_win?(piece, col)
    entire_column = @board.map { |row| row[col] }
    entire_column.map { |el| el == nil ? el : el }.join().include?(piece.to_s * 4)
  end

  def diagonal_win?(piece, col)
    move_row = @board.length - @board.map { |row| row[col] }.compact.length

    top_right = [move_row, @board[0].length - 1 - col, 3].min.times
      .map { |i| @board[move_row - (i + 1)][col + i + 1] }

    bottom_left = [@board.length - 1 - move_row, col,  3].min.times
      .map { |i| @board[move_row + i + 1][col - (i + 1)] }

    pos_slope_diagonal = bottom_left.reverse + [@board[move_row][col]] + top_right

    top_left = [move_row, col, 3].min.times
      .map { |i| @board[move_row - (i + 1)][col - (i + 1)] }

    bottom_right = [@board.length - 1 - move_row, @board[0].length - 1 - col, 3].min.times
      .map { |i| @board[move_row + i + 1][col + i + 1] }
      
    neg_slope_diagonal = top_left.reverse + [@board[move_row][col]] + bottom_right

    neg_slope_diagonal.map { |el| el == nil ? 0 : el }.join().include?(piece.to_s * 4) || 
    pos_slope_diagonal.map { |el| el == nil ? 0 : el }.join().include?(piece.to_s * 4)
    
  end

end














