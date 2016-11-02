
class ConnectFour

  NAME = "Connect Four"

  def initialize(args = {})
    @board = args[:board]   || Board.new
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

end
