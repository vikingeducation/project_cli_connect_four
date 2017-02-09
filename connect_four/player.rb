class Player
  attr_accessor :name, :piece

  def initialize(name = "Mystery Player", piece, board)
    raise "Piece must be a symbol!" unless piece.is_a?(Symbol)
    @name = name
    @piece = piece
    @board = board
  end

  def get_column
    loop do
      column = ask_for_column

      if validate_column_format(column)
        break if @board.add_piece(column, @piece)
      end
    end
  end

  def ask_for_column
    puts "Please choose a column for your next move."
    gets.strip.to_i
  end

  def validate_column_format(column)
    if column >= 1 && column <= 7
      true
    else
      puts "Your choice is not in the proper format."
    end
  end
end