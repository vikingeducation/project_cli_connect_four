require_relative "board"

#### testing
class Board
  attr_reader :game_board
  
  def create_board_structure
    7.times do |count|
      @game_board[count + 1] = Array.new(6, [:clear, :x, :o].sample)
    end
  end

  def reverse_diagonals
    diagonals_array = []
  @game_board.each_pair do |index, column|
      diag = []
      count = 0
      until index + count > @NUM_COLS || count >= @NUM_ROWS
      diag << @game_board[index + count][column.length - 1 - count]
        count += 1
      end
      diagonals_array << diag 
    end
    diagonals_array
  end

  def reverse_diagonals_down
    diagonals_array = []
    
    #first half diagonal
    @NUM_COLS.times do |col_num|
        count = 0
        diag = []
        until col_num + count >= @NUM_COLS || count >= @NUM_ROWS
          diag << @game_board[col_num + count + 1][@NUM_ROWS - count - 1]
          count += 1
        end 
        diagonals_array << diag
    end

    #second half diagonal
    (@NUM_ROWS - 1).times do |row_num|
      count = 0
      diag = []
      starting_row = 0
      until row_num + count + starting_row >= @NUM_ROWS || count >= @NUM_COLS
          diag << @game_board[count + 1][@NUM_ROWS - starting_row - count - 1]
          count += 1
      end

      starting_row += 1
      
      diagonals_array << diag
    end

    diagonals_array
  end

end

b=Board.new
b.render

puts 
print "the array is : #{b.reverse_diagonals_down} \n"

#puts b.winning_combination?

#print  b.four_in_a_row?(b.reverse_diagonals), "\n"
