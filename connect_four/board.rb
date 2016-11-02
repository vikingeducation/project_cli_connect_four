class Board
  attr_reader :board
  def initialize
    @board = Array.new(7) { ["x", "x" , "x", "x", nil,nil] }
  end

  def add_piece(column, piece)
    board[column]  << piece if board[column].length < 7
  end

  def winner?
    !!win
  end

  def win
    check_horizontal
    check_vertical
  end

  def four_in_a_row(section)
    counter = 0
    section.each.with_index(1) do |item, index|
      if item == section[index-1]
        counter += 1
      else
        counter = 0
      end
      return true if counter == 4
    end
  end

  def check_horizontal
    rows.each do |row|
      return true if four_in_a_row(row)
    end
  end

  def check_vertical
    board.each do |column|
      return true if four_in_a_row(column)
    end
  end

  def scan_board
    board.each do |column|
      5.downto(0) do |i|
        yield(column[i])
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
    board.transpose
  end
end