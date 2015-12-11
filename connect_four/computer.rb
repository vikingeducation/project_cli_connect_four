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

  def get_valid_column
    response = rand(7)
    until @board.does_column_have_space?(response)
      response = rand(7)
    end
    response
  end

  # check the board for any game winning moves.
    # I need to first see if there are any winning moves.
    # then I need it to return the column position of that winning move.
  # If there's no winning moves, scan to block any winning moves opponent.
  # If there's no moves to block add a piece to combining what could be a killer move.

  def find_best_move
    response = nil
    return 4 if @connect_four.round == 1
    if @board.winning_move?(@piece)
      response = @board.winning_move
    end
    if response == nil
      return get_valid_column
    end
    response
  end

end