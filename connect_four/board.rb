class Board

  # board = [
  #    0  1  2  3  4  5  6
  #   [r, b, r, b, b, b, b], # board[0]
  #   [0, 0, 0, 0, 0, b, 0], # board[1]
  #   [0, 0, 0, 0, 0, b, 0],
  #   [0, 0, 0, 0, 0, b, 0], # board[3]
  #   [0, 0, 0, 0, 0, 0, 0], # board[4]
  #   [0, 0, 0, 0, 0, 0, 0]
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

  # r says: 2
  # board[x][1]

  # return board array
  def update(input, color)
    if valid_move?(input)
      6.times do |i|
        if @board[i][input - 1] == 0
          @board[i][input - 1] = color
          return
        end
      end
    else
      puts "invalid"
    end

    @board
  end

  def valid_move?(input)
    @board[5][input - 1] == 0
  end


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

end

t = Board.new
t.board.each { |arr| p arr }
t.update(2,:b)
t.update(2,:r)
t.update(2,:b)
t.update(2,:r)
t.update(2,:b)
t.update(2,:r)
t.update(2,:b)
t.board.each { |arr| p arr }