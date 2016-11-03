class Board
  attr_reader :board
  def initialize
    @board = Array.new(7) { Array.new(6) }
  end

  def add_piece(column, piece)
    board[column].each_with_index do |cell, row|
      if cell.nil?
        board[column][row] = piece
        return [column, row]
      end
    end
    false
  end

  def winner?(coords)
    !!win(coords)
  end

  def win(coords)
    check_horizontal || check_vertical || check_diagonal(coords)
  end

  def four_in_a_row(section)
    counter = 0
    section.each_cons(4) do |chunk|
      return chunk[0] if chunk.all? {|piece| piece == chunk[0] && !piece.nil?}
    end
    false
  end

  def check_horizontal
    rows.each do |row|
      winner = four_in_a_row(row)
      return winner if winner
    end
    false
  end

  def check_vertical
    board.each do |column|
      winner = four_in_a_row(column)
      return winner if winner
    end
    false
  end

  def diagonal(piece, slope = true)
    diagonal_start(piece, slope)
    oper = (slope == true ? :+ : :-)
    (0..5).collect do |i| 
      if ((0..6).include?(piece[0] + i)) && ((0..5).include?(piece[1].send(oper, i)))
        board[piece[0] + i][piece[1].send(oper, i)]
      else
        nil
      end 
    end
  end

  def diagonal_start(piece, slope)
    oper, max = slope == true ? [:+, 5] : [:-, 0]
    until piece[0] == 0 || piece[1] == max
      piece[0] -= 1
      piece[1].send(oper, 1)
    end
  end

  def check_diagonal(piece)
    diagonals = []
    diagonals << diagonal(piece) << diagonal(piece, false)
    diagonals.each do |diagonal|
      winner = four_in_a_row(diagonal)
      return winner if winner
    end
    false
  end

  def scan_board
    board.each do |column|
      column.each do |cell|
        yield cell
      end
    end
  end

  def full?
    scan_board do |item|
      return false if !item
    end
    true
  end

  def rows
    board.transpose.reverse
  end
end