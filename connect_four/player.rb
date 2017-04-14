class Player
  # initialize
  def initialize(board)
    @piece = ""
    @board = board
  end

  def piece
    @piece
  end

  def def_piece(input)
    if val_piece(input)
      @piece = input
    else
      puts "please select a symbol or letter, (not a number)"
    end
  end

  # select_row
  def select_row(input)
    #
  end

  private

  # val_piece
  def val_piece(input)
    # Checks to see if input for piece value is valid
    input.is_a?(Integer) || input.length > 1 ? false : true
  end
end
