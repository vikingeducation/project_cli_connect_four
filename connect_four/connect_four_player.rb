class Player
  def initialize(board, color)
    @board = board
    @color = color
  end

  def move
    column = nil
    loop do
      column = get_move
      break if @board.valid_move?(column, @color)
    end
    @board.add_piece(column, @color)
  end

  def get_move
    puts "Enter a column to play your piece (0-6): "
    move = gets.chomp.to_i
  end

end