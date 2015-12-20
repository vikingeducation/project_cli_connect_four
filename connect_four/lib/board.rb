=begin
  readers - :grid, :winning_move

  public methods:
    - initialize
    - add_piece_to_board(column, piece)
    - does_column_have_space?(column)
    - render
    - winner?(piece)
    - winning_move?(piece)

  private methods:
    - diagonal_move?(column)
    - winning_diagonal_position(column)
    - winning_horizontal_position(column)
    - position_below_is_not_empty?(column, row, piece, piece_location)
    - one_spot_to_win?
    - horizontal_move?(column)
    - vertical_winner?(column)
    - diagonal_win?(column)
    - horizontal_win?(column)
    - render_current_board
    - set_answer(piece)
    - vertical_win?(column)
=end

class Board

  attr_reader :grid, :winning_move

  def initialize
    @answer = []
    @grid = []
    @four_in_a_row = []
    7.times {@grid << [' ', ' ', ' ', ' ', ' ', ' ']}
    @winning_move = nil
  end

  def add_piece_to_board(column, piece)
    @grid[column - 1].each_with_index do |value, row|
      if value == ' '
        @grid[column - 1][row] = piece
        break
      end
    end
  end

  def does_column_have_space?(column)
    @grid[column - 1].include? (' ')
  end

  def render
    puts "Player 1 - X"
    puts "Player 2 - O"
    puts ""
    puts " 1 2 3 4 5 6 7"
    render_current_board
    puts "==============="
    puts "//           \\\\"
    puts ""
  end

  def winner?(piece)
    set_answer(piece)
    @grid.each_with_index do |column, column_number|
      return true if vertical_win?(column)
      if column_number < 4
        return true if horizontal_win?(column_number)
        return true if diagonal_win?(column_number)
      end
    end
    false
  end

  def winning_move?(piece)
    set_answer(piece)
    @grid.each_with_index do |column, column_number|
      if vertical_winner?(column)
        @winning_move = column_number + 1
        return true
      end
      if column_number < 4
        if horizontal_move?(column_number)
          winning_horizontal_position(column_number)
          return true
        elsif diagonal_move?(column_number)
          winning_diagonal_position(column_number)
          return true
        end
      end
    end
    false
  end

  private

  def diagonal_move?(column)
    @grid[column].each_with_index do |value, row|
      if row <= 2
        @four_in_a_row = [@grid[column][row], @grid[column + 1][row + 1], @grid[column + 2][row + 2], @grid[column + 3][row + 3]]
      else
        @four_in_a_row = [@grid[column][row], @grid[column + 1][row - 1], @grid[column + 2][row - 2], @grid[column + 3][row - 3]]
      end
      return true if one_spot_to_win?
    end
    false
  end

  # The diagonal position works but it's not accurate. The position_below_is_not_empty? does not work accurately for this but good enough for now. 
  def winning_diagonal_position(column)
    @grid[column].each_with_index do |value, row|
      @four_in_a_row.each_with_index do |piece, piece_location|
        if position_below_is_not_empty?(column, row, piece, piece_location)
          return @winning_move = column + piece_location + 1
        end
      end
    end
  end

  def winning_horizontal_position(column)
    @grid[column].each_with_index do |value, row|
      @four_in_a_row.each_with_index do |piece, piece_location|
        if position_below_is_not_empty?(column, row, piece, piece_location)
          return @winning_move = column + piece_location + 1
        end
      end
    end
  end

  def position_below_is_not_empty?(column, row, piece, piece_location)
    ((piece == " ") && (row == 0 || (@grid[column + piece_location][row - 1] != " ")))
  end

  def one_spot_to_win?
    @four_in_a_row - @answer == [" "]
  end

  def horizontal_move?(column)
    @grid[column].each_with_index do |value, row|
      @four_in_a_row = [@grid[column][row], @grid[column + 1][row], @grid[column + 2][row], @grid[column + 3][row]]
        return true if one_spot_to_win?
    end
    false
  end

  def vertical_winner?(column)
    column.each_with_index do |value, index|
      if index < 3 && value != " "
        return true if ([column[index], column[index + 1], column[index + 2], column[index + 3]] - @answer) == [" "]
      end
    end
    false
  end

  def diagonal_win?(column)
    row = 0
    while row < 6
      if row <= 2
        return true if [@grid[column][row], @grid[column + 1][row + 1], @grid[column + 2][row + 2], @grid[column + 3][row + 3]] == @answer
      else
        return true if [@grid[column][row], @grid[column + 1][row - 1], @grid[column + 2][row - 2], @grid[column + 3][row - 3]] == @answer
      end
      row += 1
    end
    false
  end

  def horizontal_win?(column)
    row = 0
    while row < 6
      return true if [@grid[column][row], @grid[column + 1][row], @grid[column + 2][row], @grid[column + 3][row]] == @answer
      row += 1
    end
    false
  end

  def render_current_board
    row_number = 5
    while row_number >= 0
      column_number = 0
      while column_number <= 6
        print "|#{@grid[column_number][row_number]}"
        column_number += 1
      end
      puts "|"
      row_number -= 1
    end
  end

  def set_answer(piece)
    @answer = []
    4.times {@answer << piece}
  end

  def vertical_win?(column)
    row = 0
    while row < 3
      return true if [column[row], column[row + 1], column[row + 2], column[row + 3]] == @answer
      row += 1
    end
    false
  end

end