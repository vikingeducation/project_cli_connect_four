class Board
  attr_accessor :board, :drop, :token
    def initialize
      @board = Array.new(6){Array.new(7)}
      @drop
      @token
    end

    def render
      puts "1 2 3 4 5 6 7"
      @board.each do |row|
        row.each do |cell|
          cell.nil? ? print("_ ") : print("#{cell.to_s} ")
        end
        puts
      end
      puts
    end

    def add_token
        if token_location_valid?
          @column = @drop
          @row = rows_available[@drop]
          @board[@row][@column] = @token
            true
        else
            false
        end
    end

    def  token_location_valid?
        if (0..6).include?(@drop)
            true
        else
            puts "token drop_column are out of bounds"
        end
    end

    def rows_available
      moves_arr = []
      7.times do |col|
       (5).downto(0) do |rows|
         if @board[rows][col].nil?
           moves_arr << rows
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
        diagonal = [@board[@row][@column], @board[@row + 1][@column + 1], @board[@row + 2][@column + 2], @board[@row + 3][@column + 3] ]
        if diagonal.all? {|cell| cell == @token }
          return true
        end
      end
        #up right
      if (@column <= 3) && (@row >= 3)
        diagonal = [@board[@row][@column], @board[@row - 1][@column + 1], @board[@row - 2][@column + 2], @board[@row - 3][@column + 3] ]
        if diagonal.all? {|cell| cell == @token }
          return true
        end
      end
        #down left
      if (@column >= 3) && (@row <= 2)
        diagonal = [@board[@row][@column], @board[@row + 1][@column - 1], @board[@row + 2][@column - 2], @board[@row + 3][@column - 3] ]
        if diagonal.all? {|cell| cell == @token }
          return true
        end
      end
        #up left
      if (@column >= 3) && (@row >= 3)
        diagonal = [@board[@row][@column], @board[@row - 1][@column - 1], @board[@row - 2][@column - 2], @board[@row - 3][@column - 3] ]
        if diagonal.all? {|cell| cell == @token }
          return true
        end
      end
      return false
    end

    def winning_vertical?
        if @row <= 2
          vertical = [@board[@row][@column], @board[@row + 1][@column], @board[@row + 2][@column], @board[@row + 3][@column] ]
           if vertical.all? {|cell| cell == @token }
             return true
           end
        end
        if @row >= 3
          vertical = [@board[@row][@column], @board[@row][@column - 1], @board[@row][@column - 2], @board[@row][@column - 3] ]
          if vertical.all? {|cell| cell == @token }
            return true
          end
          return false
        end
    end

    def winning_horizontal?
      if @column <= 3
        horizontal = [@board[@row][@column], @board[@row ][@column + 1], @board[@row][@column + 2], @board[@row][@column + 3 ]]
        if horizontal.all? {|cell| cell == @token }
          return true
        end
      end
      if @column >= 3
        horizontal = [@board[@row][@column], @board[@row][@column - 1], @board[@row][@column - 2], @board[@row][@column - 3] ]
        if horizontal.all? {|cell| cell == @token }
          return true
        end
        return false
      end
    end

    def full?
        @board.all? do |row|
            row.none?(&:nil?)
        end
    end

end
