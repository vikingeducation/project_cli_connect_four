class Board
  def initialize
    @redsPositions = []
    @bluesPositions = []
  end

  def add_piece(player, col)
    valid_drop?(col)
    row = get_row(col)
    position = [col, row]
    position.winning_combos
    player == red ? @redsPositions << position : @bluesPositions << position
  end

  def get_row(col)
    row = col.length - 1
    row
  end

  def not_full?(col)
    col.length < 7
  end

  def valid_drop?(col)
    col.in_bounds? && col.not_full?
  end

  def in_bounds?(col)
    (0..6).include? col
  end

  def winning_combos(position)
    vertical_win?(position)
  end

  def vertical_win?(position)

  end
end


2,1 -- 3,2 4,3 5,4
       1,2 0,3 -,4

4,4 --increase 1,1 or -1,-1
      3,5 2,6  1,-1   -1, 1
      5,3 6,2

      [1,2]

# position class
# any one middle position has max 16 wins
# - has properties: color or nil, coordinates

# When player drop piece generate a hash of winning combos or array of arrays
# player only gives x,
winningCombos = { :vert => [], :hori => [[]], :diag => [[]] }

# VECTOR
(5, 4)
# vertical win at [0, [-4]]
# horizontal win at [[-4..4], 0]
# diagonal [[4..-4], [4..-4](same number)] and [[-4..4], [4..-4] (opposite numbers)]
