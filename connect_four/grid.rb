class Grid
  attr_reader :grid

  EMPTY_SPOT = 'O'.freeze

  def initialize
    @grid = Array.new(7) { Array.new(6, EMPTY_SPOT) }
  end

  def full?
    grid.size.times do |col_num|
      return false if valid_move?(col_num)
    end

    true
  end

  def valid_move?(column)
    chosen_column = column.to_i
    grid[chosen_column.to_i - 1].any? { |spot| spot == EMPTY_SPOT } ? true : false
  end

  # call valid_move? first
  def record_move(column, player_disc)
    chosen_column = column.to_i
    target_spot = grid[chosen_column - 1].index(EMPTY_SPOT)
    grid[chosen_column - 1][target_spot] = player_disc
  end

  def to_s
    grid_as_string = " 1 2 3 4 5 6 7\n"
    grid_as_string += "---------------\n"
    displayable_grid.each do |row|
      grid_as_string += "|#{row.join('|')}|\n"
    end
    grid_as_string += "---------------\n"

    grid_as_string
  end

  def winner?(player_disc)
    vertical_winner?(player_disc)||
      horizontal_winner?(player_disc) ||
      diagonal_winner?(player_disc)
  end

  private

  def diagonal_winner?(player_disc)
    winning_config = player_disc * 4
    right_to_left_diag?(winning_config) || left_to_right_diag?(winning_config)
  end

  def displayable_grid
    transposed_grid.reverse
  end

  def horizontal_winner?(player_disc)
    winning_config = player_disc * 4
    transposed_grid.each do |row|
      return true if row.join('').include? winning_config
    end

    false
  end

  def left_to_right_diag?(winning_config)
    viable_columns = (3..6)
    viable_rows = (0..2)

    viable_columns.each do |col|
      viable_rows.each do |row|
        diagonals = (0..3).collect { |start_position| grid[col - start_position][start_position + row] }
        return true if diagonals.join('').include? winning_config
      end
    end

    false
  end

  def right_to_left_diag?(winning_config)
    viable_columns = (0..3)
    viable_rows = (0..2)

    viable_columns.each do |col|
      viable_rows.each do |row|
        diagonals = (0..3).collect { |start_position| grid[col + start_position][start_position + row] }
        return true if diagonals.join('').include? winning_config
      end
    end

    false
  end

  def vertical_winner?(player_disc)
    winning_config = player_disc * 4
    grid.each do |column|
      return true if column.join('').include? winning_config
    end

    false
  end

  def transposed_grid
    grid.transpose
  end
end