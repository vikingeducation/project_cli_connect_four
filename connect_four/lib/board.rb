require_relative 'board'
require_relative 'game'
require_relative 'player'

class Board
  DIAGONAL_VECTORS = [
                       [[-3,-3], [-2,-2], [-1,-1], [0,0]],
                       [[-2,-2], [-1,-1], [0,0], [1,1]],
                       [[-1,-1], [0,0], [1,1], [2,2]],
                       [[0,0], [1,1], [2,2], [3,3]],
                       [[0,0],[1,-1],[2,-2],[3,-3]],
                       [[-3,3],[-2,2],[-1,1],[0,0]],
                       [[-2,2],[-1,1],[0,0],[1,-1]],
                       [[-1,1],[0,0],[1,-1],[2,-2]],
                     ]
                     attr_reader :columns

  def initialize(columns=Array.new(6) {[]})
    @reds_positions = []
    @blues_positions = []
    @columns = columns
  end

  def add_piece(player, col)
    row = get_row(col)
    @columns[col][row] = player.symbol if valid_drop?(col)
    position = [col, row]
    player_array(player).push position
    @last_piece = position
  end

  def get_row(col)
    row = @columns[col].length
  end

  def valid_drop?(col)
    in_bounds?(col) && not_full?(col)
  end

  def not_full?(col)
    @columns[col].length < 7
  end

  def in_bounds?(col)
    (0..6).include? col
  end

  def winning_combos(position)
    combos = {}
    combos[:vert] = vertical_combos(position)
    combos[:hori] = horizontal_combos(position)
    combos[:diag] = diagonal_combos(position)
    combos
  end

  def vertical_combos(position)
    [position,
    [position[0], (position[1] - 1)],
    [position[0], (position[1] - 2)],
    [position[0], (position[1] - 3)]]
  end

  def horizontal_combos(position)
    hori_combos =[]
    [(-3..0), (-2..1), (-1..2), (0..3)].each do |r|
      combos =[]
      r.each do |num|
        combos.push([(position[0] + num), position[1]])
      end
      hori_combos.push(combos)
    end
    hori_combos
  end

  def diagonal_combos(position)
    diag_combos = check_diagonals(DIAGONAL_VECTORS, position)
  end

  def check_diagonals(direction, position)
    poss_wins = [] # array of position coodinates
    direction.each do |vectors|
      single_combo = []
      vectors.each do |vector|
        single_combo << add(position, vector)
      end
      poss_wins.push(single_combo)
    end
    poss_wins
  end

  def add(position, v)
    [position[0] + v[0], position[1] + v[1]]
  end

  def player_array(player)
    player.color == 'red' ? @reds_positions : @blues_positions
  end

  def render
    @columns.transpose.each do |row|
      p row.join '|'
    end
    puts "_____________"
    puts "0|1|2|3|4|5|6"
  end

  def four_in_a_row?(player, last_piece)
    win_combos = winning_combos(last_piece)
    four_in_a_row = false
    win_combos.each do |direction, win_combo|
      four_in_a_row = win_combo.all? do |position|
        player_array(player).include? position
      end
      break if four_in_a_row == true
    end
    four_in_a_row
  end

end
