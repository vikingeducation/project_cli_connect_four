=begin
  public - move_piece
           - set up: board
                     needs to access column_valid?
                     needs to access board.place_piece
                     takes column to move to
                     takes players piece
         - column - method and reader - skip for now per instructions - puts/gets
         - game_piece - reader
           - set up: piece assigned on initialization
         - name - reader
           - set up: name assigned on initialization

  private - column_valid?

=end

class Player

  attr_reader :game_piece, :name, :column

  def initialize(game_piece, board, name)
    @game_piece = game_piece
    @board = board
    @name = name
  end


  def move_piece(move_to_column, piece)
    if column_valid?(move_to_column)
      @board.place_piece(move_to_column, piece)
    else
      move_piece(column, piece)
    end
  end


  def column
    puts "In which column would you like to place your piece? enter '1-7' or 'q' to quit"
    column = gets.chomp
    column.downcase == "q" ? exit : column = column.to_i - 1
  end

  private

  def column_valid?(column)
    if column > 6
      raise "That is not a valid column"
      false
    elsif @board.column_full?(column)
      puts "This column is full, please choose a different column"
      false
    else
      true
    end
  end


end


class AI < Player

  attr_reader :game_piece, :name, :column

  def initialize(game_piece, board, name)
    super
  end

  def column
    rand 0..6
  end



  def move_piece(column, piece)
    @board.place_piece(column, piece)
  end

end
