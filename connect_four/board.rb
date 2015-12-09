class Board

  def initialize
    @grid = []
    7.times {@grid << [' ', ' ', ' ', ' ', ' ', ' ']}
  end

  def add_piece_to_board(response, piece)
    @grid[response - 1].each_with_index do |value, index|
      if value == ' '
        @grid[response - 1][index] = piece
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
    @grid.each_with_index do |column, index|
      return true if vertical_four?(piece, column)
      if index < 4
        #return true if horizonal_win?(piece, index)
        #return true if diagonal_win?(piece, index)
      end
    end
    false
  end

  private

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

  def vertical_four?(piece, column)
    answer = [piece, piece, piece, piece]
    row = 0
    while row < 3
      if [column[row], column[row + 1], column[row + 2], column[row + 3]] == answer
        return true
      end
      row += 1
    end
    false
  end

end