class Player
  attr_accessor :board, :piece
  # initialize
  def initialize(board)
    @piece = ""
    @board = board.board_arr
  end

  # def piece
  #   @piece
  # end

  def def_piece(input)
    if val_piece(input)
      @piece = input
    else
      puts "please select a symbol or letter, (not a number)"
    end
  end

  # select_row
  def select_row(input)
    selection = (input - 1).to_i
    if val_input(selection)
      reversed = @board[selection].reverse
      puts reversed.to_s
      row_position = reversed.index("-")
      puts "#{row_position} is an empty row!"
      @board[selection][row_position] = @piece

      true
    else
      false
    end

  end

  private

  # val_piece
  def val_piece(input)
    # Checks to see if input for piece value is valid
    input.is_a?(Integer) || input.length > 1 ? false : true
  end

  def val_input(input)
    if input.between?(0,6) && @board[input][0] == "-"
      true
    else
      false
    end
  end

end
