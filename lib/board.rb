class Board
  attr_reader :board
  def initialize(saved = nil)
    @board = saved || Array.new(7) { Array.new(6) }
  end

  def add_piece(column, piece)
    return false if invalid_column?(column)
    board[column].each_with_index do |cell, row|
      if cell.nil?
        board[column][row] = piece
        return [column, row]
      end
    end
    false
  end

  def close_to_win(piece)
    section = board[check_vertical(3)] if check_vertical(3)
    if section
      section.each_cons(4) do |chunk|
        return false if chunk[-1] == piece
      end
      check_vertical(3)
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

  def win(coords)
    check_horizontal || check_vertical || check_diagonal(coords)
  end

  def winner?(coords)
    !!win(coords)
  end

  private

    def check_diagonal(piece)
      diagonals = []
      diagonals << diagonal(piece.dup) << diagonal(piece.dup, false)
      diagonals.each do |diagonal|
        winner = four_in_a_row(diagonal)
        return winner if winner
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

    def check_vertical(size = 4)
      board.each_with_index do |column, i|
        winner = four_in_a_row(column, size)
        return i if  winner && size == 3
        return winner if winner
      end
      false
    end

    def diagonal(piece, slope = true)
      start = diagonal_start(piece.dup, slope)
      oper = (slope == true ? :+ : :-)
      (0..5).collect do |i| 
        if ((0...board.length).include?(start[0] + i)) && 
           ((0...board[0].length).include?(start[1].send(oper, i)))
          board[start[0] + i][start[1].send(oper, i)]
        else
          nil
        end 
      end
    end

    def diagonal_start(piece, slope)
      oper, max = (slope == true ? [:-, 0] : [:+, (board[0].length-1).to_i])
      until piece[0] == 0 || piece[1] == max
        piece[0] -= 1
        piece[1] = piece[1].send(oper, 1)
      end
      piece
    end

    def four_in_a_row(section, size=4)
      section.each_cons(size) do |chunk|
        return chunk[0] if chunk.all? {|piece| piece == chunk[0] && !piece.nil?}
      end
      false
    end

    def invalid_column?(column)
      return false if (0...board.length).include?(column)
      true
    end

    def scan_board
      board.each do |column|
        column.each do |cell|
          yield cell
        end
      end
    end
end