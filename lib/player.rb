class Player
  attr_accessor :name, :piece, :num_of_players

  def initialize(name, piece, board)
    raise "Piece must be a symbol!" unless piece.is_a?(Symbol)
    @name = name
    @piece = piece
    @board = board
    @num_of_players = 2
  end

  def get_column
    loop do
      puts "# #{@name}, #{@piece}, enter your desired move: "
      column = gets.strip.to_i
      if valid_move?(column)
        break if @board.add_piece(column, @piece)
      end
    end
  end

  def valid_move?(column)
    if column.is_a?(Integer)
      true
    else
      puts "# You have entered your move improperly, please try again."
      false
    end
  end

end