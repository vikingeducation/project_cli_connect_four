class Board
  attr_accessor :board

  def initialize
    @board = build_board
  end

  def build_board
    board_temp = {}
    ("A".."F").to_a.each do |row|
      ("1".."7").to_a.each do |column|
        board_temp[[row, column]] = nil
      end
    end
    board_temp
  end

  def at(row, column)
    @board[[row, column]]
  end

  def populate_board(column, color)
    row = open_row(column)
    @board[[row, column]] = color
  end

  def open_row(column_num)
    single_column = get_column(column_num).select{ |space| space.nil? }
    single_column[0][0]
  end

  def legal_move?(column_num)
    open_row(column_num)
  end

  def winning_combo?(current_color)
    four_vertical?(current_color) || four_horizontal?(current_color) || four_diagonal?(current_color)
  end

  def board_full?
    @board.any? { |key, value| value.nil? }
  end

  def four_vertical(color)
    !(1..7).to_a.select{ |num| get_column(num).count(color) == 4 }.any?
  end

  def four_horizontal
  end

  def four_diagonal
  end

  def get_column(column_num)
    @board.keys.select{ |coord| coord[1] == column_num }
  end

  def get_row
    @board.keys.select{ |coord| coord[1] == column_num }
  end

  def get_diagonal
  end

end
