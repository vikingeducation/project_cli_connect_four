
class ConnectFour
  attr_accessor :board

  NAME = "Connect Four"

  def initialize(args = {})
    @board = args[:board] || Board.new
  end

  def add_piece(column, piece)
    board.add_piece(column, piece)
  end

  def instructions
    ["The board is a 6 x 7 grid.",
    "Each turn you will add one piece to a column",
    "The first player to connect four (horizontally, vertically,",
    "or diagonally) wins"]
  end

  def name
    NAME
  end

  def render
    board.render
  end

  def valid_move?(move)
    board.in_range?(move.to_i) &&
    board.column_not_full?(move.to_i)
  end

  def over?
    win? || draw?
  end

  def win?
    board.four_in_a_row?
  end

  def draw?
    board.full?
  end
end
