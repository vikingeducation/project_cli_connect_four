class Player

  attr_reader :game_piece, :name, :column

  def initialize(game_piece, board, name)
    @game_piece = game_piece
    @board = board
    @name = name
  end


  def move_piece(column, piece)
    if column_valid?(column)
      @board.place_piece(column, piece)
    else
      move_piece(column, piece)
    end
  end


  def column
    puts "In which column would you like to place your piece? enter '1-7' or 'q' to quit"
    column = gets.chomp
    column.downcase == "q" ? exit : column = column.to_i - 1
  end


  def column_valid?(column)
    if column > 6
      puts "That is not a valid column"
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
