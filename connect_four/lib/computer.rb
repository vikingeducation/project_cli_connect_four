=begin
  public methods:
    - initialize(board, piece, game)
    - turn

  private methods:
    - get_random_valid_column
    - find_best_move
=end

class Computer

  def initialize(board, piece, game)
    @connect_four = game
    @board = board
    @piece = piece
    @answer = []
    4.times {@answer << piece}
  end

  def turn
    puts "'s turn:"
    @board.add_piece_to_board(find_best_move, @piece)
  end

  private

  def get_random_valid_column
    column = rand(7)
    until @board.does_column_have_space?(column)
      column = rand(7)
    end
    column
  end

  def find_best_move
    return 4 if @connect_four.round == 1
    if @board.winning_move?(@piece)
      return @board.winning_move
    end
    get_random_valid_column
  end

end