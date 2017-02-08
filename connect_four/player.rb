# Manages all player-related functionality
class Player
# initialize
  # Set marker type (e.g. X or O)

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