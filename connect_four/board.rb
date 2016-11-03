class Board

  # board = [
  #    0  1  2  3  4  5  6
  #   [r, b, r, b, b, b, b], # board[0]
  #   [0, 0, 0, 0, 0, b, 0], # board[1]
  #   [0, 0, 0, 0, 0, b, 0], # board[2]
  #   [0, 0, 0, 0, 0, b, 0], # board[3]
  #   [0, 0, 0, 0, 0, 0, 0], # board[4]
  #   [0, 0, 0, 0, 0, 0, 0]  # board[5]
  # ]

  attr_accessor :board # temp

  def initialize
    @board = # 0  1  2  3  4  5  6
              [
              [0, 0, 0, 0, 0, 0, 0], # 0
              [0, 0, 0, 0, 0, 0, 0], # 1
              [0, 0, 0, 0, 0, 0, 0], # 2
              [0, 0, 0, 0, 0, 0, 0], # 3
              [0, 0, 0, 0, 0, 0, 0], # 4
              [0, 0, 0, 0, 0, 0, 0]  # 5
              ]
  end

  # update board array
  def update(input, color)
    6.times do |i|
      if @board[i][input - 1] == 0
        @board[i][input - 1] = color
        return
      end
    end
    self
  end

  # check that column is not full
  def valid_move?(input)
    @board[5][input - 1] == 0
  end

  def horizontal_win?(color)
    # each row that has 4 or more values

    @board.each_with_index do |row_arr, row_num|

      start_point = 0
      end_point = 3

      (start_point..end_point).each do |col_num|
        return true if row_arr[col_num..col_num + 3].all? { |piece| piece == color }
      end
    end

    false

    #
      # find a starting coordinate [0, 1, 2, 3] == player
        # check the final coordinate: [index + 3] == player
          # check the 3rd coordinate: [index + 2]
            # check the 2nd coord: [index + 1]
              # return true => win condition
  end

  def vertical_win?(color)
    false
  end

  def diagonal_win?(color)
    false
  end



  # vertical:
    # use .transpose

  # diagonal:
    # starting points => x: [0..3] y: [0..2]
    # coordinate system
      # check if a coordinate == player/color: [0][0]
        # find the last (4th value) [index+3][index+3] == player
          # find 3rd
            # find 2nd
              # return true
    # reverse each array => repeat

  # instance of board: keeps track of moves
  # return what the board is

  # if board is full, returns true
  def full?
    !@board.flatten.include?(0)
  end

end
