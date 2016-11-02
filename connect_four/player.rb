class Player
  def initialize(board, piece)
    @board = board
    @piece = piece
  end

  def make_move
    loop do
      column_number = choose_column
      break if @board.add_piece(column_number, @piece)
      puts "You cannot choose a full column"
    end
  end

end