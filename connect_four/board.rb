#board.rb
class Board

 #   [_] [_] [_] [_] [_] [_] [_]  
 #   [_] [_] [_] [_] [_] [_] [_] 
 #   [_] [_] [_] [_] [_] [_] [_] 
 #   [_] [_] [_] [_] [_] [_] [_] 
 #   [o] [_] [_] [_] [_] [_] [_] 
 #   [o] [_] [_] [_] [_] [_] [_] 
 #    1   2   3   4   5   6   7    
#data = {  1 => [ :o, :o, :clear ,  :clear,  _ , _  ] ,  2 => [].... }

  def initialize
    @NUM_ROWS = 6
    @NUM_COLS = 7
    @game_board = {}
    create_board_structure

  end

  def render
    render_hash = { :o => "[o]", :x => "[x]", :clear => "[_]" }
    @NUM_ROWS.downto(1) do |row|
      @NUM_COLS.times do |col|
        print "#{render_hash[ @game_board[col + 1][row - 1] ]} "
      end
      puts
    end
    
    @NUM_COLS.times { |col| print " #{col + 1}  " }
    puts
  end

  def add_piece(column, piece)
    return false if column_full?(column)

    row = nil

    @game_board[column].each_index do |index|
      row ||= index if @game_board[column][index] == :clear  
    end
    
    @game_board[column][row] = piece
    true
  end

  def column_full?(column)
    @game_board[column][-1] != :clear
  end

  def full?
    @NUM_COLS.times do |col|
      return false unless column_full?(col + 1)
    end

    true
  end

  def winning_combination?
    four_in_a_row?(diagonals) ||
    four_in_a_row?(verticals) ||
    four_in_a_row?(horizontals)
  end

  def four_in_a_row?(sequences)
    sequences.each do |sequence|
      count = 0
      current_piece = sequence[0]
      sequence.each_index do |index|
#skip first iteration
        next if index == 0
#return if empty slot
        if sequence[index] == :clear
          current_piece = :empty
          count = 0
        end
# check for sequence of four
        if current_piece == sequence[index]
          count += 1
        else 
          current_piece = sequence[index]
          count = 0
        end
        return true if count == 3
      end
    end
    false
  end

  def diagonals
    diagonals_array = []
    diagonals_array << diagonals_up << diagonals_down
  end

  def diagonals_up
    diagonals_array = []
    
    #first half diagonal
    @NUM_COLS.times do |col_num|
        count = 0
        diag = []
        until col_num + count >= @NUM_COLS || count >= @NUM_ROWS
          diag << @game_board[col_num + count + 1][count]
          count += 1
        end 
        diagonals_array << diag
    end
    #second half diagonal
    (@NUM_ROWS - 1).times do |row_num|
      count = 0
      diag = []
      until row_num + count >= @NUM_ROWS || count + 1 >= @NUM_COLS
          diag << @game_board[count + 1][row_num + count]
          count += 1
        end 
        diagonals_array << diag
    end

    diagonals_array
  end

  def verticals
    verticals_array = []
    @NUM_COLS.times { |col| verticals_array << @game_board[col+1] }
    verticals_array
  end

  def horizontals
    horizontals_array = []
    @NUM_ROWS.downto(1) do |row|
      row_array = []
      @NUM_COLS.times { |col| row_array << @game_board[col + 1][row - 1] }
      horizontals_array << row_array
    end
    horizontals_array
  end

  def create_board_structure
    7.times do |count|
      @game_board[count + 1] = Array.new(6, :clear)
    end
  end

  def diagonals_down
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

