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

  def populate_board(location, color)

    @board[@board.at(location)]

  end

  def winning_combo?

  end

  def board_full?

  end
end
