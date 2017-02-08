# Manages all player-related functionality
class Player
  attr_accessor :name, :piece

  # initialize
  def initialize(name = "Mystery Player", piece, board)
    # Set marker type (e.g. X or O)
    raise "Piece must be a symbol!" unless piece.is_a?(Symbol)
    @name = name
    @piece = piece
    @board = board
  end

# get_column
  # loop infinitely
    # ask_for_column
      # IF validate_column_format is true
        # IF piece can be placed on Board
          # break the loop

# ask_for_column
  # display message asking for column
    # pull column choice from command line

# validate_column_format
  # UNLESS column choice is in the proper format
    # display error message
end