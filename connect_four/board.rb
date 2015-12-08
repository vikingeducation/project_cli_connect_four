class Board

  def initialize
    @grid = []
    6.times {@grid << [' ', ' ', ' ', ' ', ' ', ' ', ' ']}
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

  def render_current_board
    row_number = 0
    row = @grid[row_number]
    while row_number < 6
      column = 0
      while column < 7
        print "|#{row[column]}"
        column += 1
      end
      puts "|"
      row_number += 1
    end
  end

end