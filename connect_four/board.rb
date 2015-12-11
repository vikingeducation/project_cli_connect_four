class Board

  attr_reader :grid, :winning_move

  def initialize
    @answer = []
    @grid = []
    @horizontal_four = []
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
    @answer = []
    4.times {@answer << piece}
    @grid.each_with_index do |column, index|
      return true if vertical_four?(column)
      if index < 4
        return true if horizontal_win?(index)
        return true if diagonal_win?(index)
      end
    end
    false
  end

  # How do you determine a winning move?
  # by seeing any four in a rows and there's a gap to fill with your piece.
  def winning_move?(piece)
    @answer = []
    4.times {@answer << piece}
    @grid.each_with_index do |column, index|
      if vertical_move?(column)
        @winning_move = index + 1
        return true 
      end
      if index < 4
        if horizontal_move?(index)
          @winning_move = winning_horizontal_position(index) + 1
          puts @winning_move
          return true
        end
      end
    end
    false
  end

  private

  def winning_horizontal_position(index)
    position = nil
    @grid[index].each_with_index do |value, spot|
      if valid_horizontal_finisher?(index, spot)
        @horizontal_four.each_with_index do |piece, location|
          if ((piece == " ") && (spot == 0 || (@grid[index + location][spot - 1] != " ")))
            return position = index + location
          end
        end
      end
    end
  end

  def valid_horizontal_finisher?(index, spot)
    if @horizontal_four - @answer == [" "]
      return true
    end
    false
  end

  def horizontal_move?(column)
    @grid[column].each_with_index do |spot, index|
      @horizontal_four = [@grid[column][index], @grid[column + 1][index], @grid[column + 2][index], @grid[column + 3][index]]
      if valid_horizontal_finisher?(column, index)
        return true
      end
    end
    false
  end

  def vertical_move?(column)
    column.each_with_index do |value, index|
      if index < 3
        if (([column[index], column[index + 1], column[index + 2], column[index + 3]] - @answer).size == 1) && (([column[index], column[index + 1], column[index + 2], column[index + 3]] - @answer).include? " ")
          return true
        end
      end
    end
    false
  end

  def diagonal_win?(index)
    row = 0
    while row < 6
      if row <= 2
        return true if [@grid[index][row], @grid[index+1][row + 1], @grid[index + 2][row + 2], @grid[index+3][row + 3]] == @answer
      else
        return true if [@grid[index][row], @grid[index+1][row - 1], @grid[index+2][row - 2], @grid[index+3][row - 3]] == @answer
      end
      row += 1
    end
    false
  end

  def horizontal_win?(index)
    row = 0
    while row < 6
      return true if [@grid[index][row], @grid[index+1][row], @grid[index+2][row], @grid[index+3][row]] == @answer
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

  def vertical_four?(column)
    row = 0
    while row < 3
      return true if [column[row], column[row + 1], column[row + 2], column[row + 3]] == @answer
      row += 1
    end
    false
  end

end