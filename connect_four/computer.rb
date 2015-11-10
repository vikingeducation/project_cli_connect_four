class Computer < Player

  def initialize(board, symbol)
    super(board, symbol)
    @name = "Skynet"
  end

  def get_move
    move = empty_columns.sample + 1
    @board.place_move(move, @symbol)
  end

  private

  def empty_columns
    (0..6).select{ |column| @board.spot_open?(column) }
  end
end