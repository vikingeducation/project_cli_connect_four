# 6x7 board

# class ConnectFour
  # requires other files
  # validate user move (legal move)
    # out of bounds/board
    # out of top/no more space in col
  # win conditions
    # win
      # 4 in a row
      # 4 in col
      #
    # draw

# class Prompt/Listener
  # asks for user inputs
  # validate user input

# class Player
  # controlling where you can put pieces
    # talks to board to figure this out

  # instantiate with color
    # red player
    # black player

  # Later on
    # HumanPlayer < Player
    # ComputerPlayer < Player

# class Board
  board = [
     0  1  2  3  4  5  6
    [r, b, r, b, b, b, b], # board[0]
    [0, 0, 0, 0, 0, b, 0], # board[1]
    [0, 0, 0, 0, 0, b, 0],
    [0, 0, 0, 0, 0, b, 0], # board[3]
    [0, 0, 0, 0, 0, 0, 0], # board[4]
    [0, 0, 0, 0, 0, 0, 0]
  ]
    # horizontal:
      # each row that has 4 or more values
        # find a starting coordinate [0, 1, 2, 3] == player
          # check the final coordinate: [index + 3] == player
            # check the 3rd coordinate: [index + 2]
              # check the 2nd coord: [index + 1]
                # return true => win condition

    # vertical:
      # use .transpose

    # diagonal:
      # coordinate system

      #
        # check if a coordinate == player/color: [0][0]
          # find the last (4th value) [index+3][index+3] == player
            # find 3rd
              # find 2nd
                # return true



        x _ _ x
        x _ _ x

  # instance of board: keeps track of moves
  # return what the board is

# class Display
  # display board between turns
  # display input (feedback)
  # display who won
  # display instructions