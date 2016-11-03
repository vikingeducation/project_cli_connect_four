require 'matrix'

class Board
  attr_reader :board
  def initialize
    @board = Array.new(7) { [nil, nil, nil, nil, nil, nil] }
  end

  def add_piece(column, piece)
    board[column].each_with_index do |cell, row|
      if !cell
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
    # check_horizontal || check_vertical || 
    check_diagonal(coords)
  end

  def four_in_a_row(section)
    counter = 0
    section.each.with_index(1) do |item, index|
      if (item == section[index-1] && !item.nil?)
        counter += 1
      else
        counter = 0
      end
      return true if counter == 4
    end
    false
  end

  def check_horizontal
    rows.each do |row|
      return true if four_in_a_row(row)
    end
    false
  end

  def check_vertical
    board.each do |column|
      return true if four_in_a_row(column)
    end
    false
  end

  def negative_diagonal(piece)
    until piece[0] == 0 || piece[1] == 5
      piece[0] -= 1
      piece[1] += 1
    end
    (0..5).collect { |i| board[piece[0] + i][piece[1] - i] }
  end

  def positive_diagonal(piece)
    until piece[0] == 0 || piece[1] == 0
      piece[0] -= 1
      piece[1] -= 1
    end
    (0..5).collect { |i| board[piece[0] + i][piece[1] + i] }
  end

  def check_diagonal(piece)
    diagonals = []
    diagonals << positive_diagonal(piece)
    diagonals << negative_diagonal(piece)
    diagonals.each do |diagonal|
      return true if four_in_a_row(diagonal)
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