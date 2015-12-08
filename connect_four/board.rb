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

  private

  # it's rendering top left to bottom right
  # so the first while loop needs to count down (row numbers)
  # second while loop needs to count up (column numbers)
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

end