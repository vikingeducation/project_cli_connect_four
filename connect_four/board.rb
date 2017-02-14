class Board
  attr_accessor :board_state, :drop, :token
    def initialize
      @board_state = Array.new(6){Array.new(7)}
      @drop
      @token
    end

    def render
      puts "1 2 3 4 5 6 7"
      @board_state.each do |row|
        row.each do |cell|
          cell.nil? ? print("_ ") : print("#{cell.to_s} ")
        end
        puts
      end
      puts
    end

    def add_token
      @column = @drop
      @row = rows_available[@drop]
      @board_state[@row][@column] = @token
    end

    def remove_test
      @board_state[@row][@column] = nil
    end

    def rows_available
      moves_arr = []
      7.times do |col|
        moves_arr << nil
       (5).downto(0) do |row|
         if @board_state[row][col].nil?
           moves_arr[col] = row
           break
         end
       end
     end
     return moves_arr
    end

    def winning_combination?
        winning_diagonal?   ||
        winning_horizontal? ||
        winning_vertical?
    end

    def winning_diagonal?
      diagonal = []
      #down right
      if (@column <= 3) && (@row <= 2)
        diagonal = [@board_state[@row][@column], @board_state[@row + 1][@column + 1], @board_state[@row + 2][@column + 2], @board_state[@row + 3][@column + 3] ]
        if diagonal.all? {|cell| cell == @token }
          return true
        end
      end
        #up right
      if (@column <= 3) && (@row >= 3)
        diagonal = [@board_state[@row][@column], @board_state[@row - 1][@column + 1], @board_state[@row - 2][@column + 2], @board_state[@row - 3][@column + 3] ]
        if diagonal.all? {|cell| cell == @token }
          return true
        end
      end
        #down left
      if (@column >= 3) && (@row <= 2)
        diagonal = [@board_state[@row][@column], @board_state[@row + 1][@column - 1], @board_state[@row + 2][@column - 2], @board_state[@row + 3][@column - 3] ]
        if diagonal.all? {|cell| cell == @token }
          return true
        end
      end
        #up left
      if (@column >= 3) && (@row >= 3)
        diagonal = [@board_state[@row][@column], @board_state[@row - 1][@column - 1], @board_state[@row - 2][@column - 2], @board_state[@row - 3][@column - 3] ]
        if diagonal.all? {|cell| cell == @token }
          return true
        end
      end
      return false
    end

    def winning_vertical?
        if @row <= 2
          vertical = [@board_state[@row][@column], @board_state[@row + 1][@column], @board_state[@row + 2][@column], @board_state[@row + 3][@column] ]
           if vertical.all? {|cell| cell == @token }
             return true
           end
        end
        if @row >= 3
          vertical = [@board_state[@row][@column], @board_state[@row][@column - 1], @board_state[@row][@column - 2], @board_state[@row][@column - 3] ]
          if vertical.all? {|cell| cell == @token }
            return true
          end
          return false
        end
    end

    def winning_horizontal?
      if @column <= 3
        horizontal = [@board_state[@row][@column], @board_state[@row ][@column + 1], @board_state[@row][@column + 2], @board_state[@row][@column + 3 ]]
        if horizontal.all? {|cell| cell == @token }
          return true
        end
      end
      if @column >= 3
        horizontal = [@board_state[@row][@column], @board_state[@row][@column - 1], @board_state[@row][@column - 2], @board_state[@row][@column - 3] ]
        if horizontal.all? {|cell| cell == @token }
          return true
        end
        return false
      end
    end

    def full?
        @board_state.all? do |row|
            row.none?(&:nil?)
        end
    end

end
