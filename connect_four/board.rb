require 'matrix'

class Board
  attr_reader :board
  def initialize
    @board = Array.new(7) { [nil, nil, nil, nil, nil, nil] }
  end

  def add_piece(column, piece)
    # check column rows from bottom to top
    # place piece if nil
    board[column].each do |cell|
      if !cell
        board[column][cell] = piece 
        return true
      end
    end
    false
  end

  def winner?
    !!win
  end

  def win
    p check_horizontal
    p check_vertical
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

  def check_diagonal
    p (0..5).collect { |i| board[i][i] }
  end

  def scan_board
    board.each do |column|
      column.each do |cell|
        yield(column[cell])
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