class Board
  attr_reader :board
  def initialize
    @board = Array.new(7) { [nil, nil, nil, nil, nil, nil] }
  end

  def add_piece(column, piece)
    # check column rows from bottom to top
    # place piece if nil
    piece_placed = false
    temp = board[column].map do |cell|
      if !cell && !piece_placed
        piece_placed = true
        piece
      else
        cell
      end
    end
    p board[column] = temp
    false
  end

  def winner?
    !!win
  end

  def win
    check_horizontal || check_vertical
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

  def check_diagonal
    (0..5).collect { |i| board[i][i] }
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