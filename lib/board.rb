class Board
    def initialize(board_state = nil)
      @columns = (board_state || make_board)
    end

    def render
      system 'clear'
      5.downto(0) do |position|
        print "\n"
        1.upto(7) do |col_num|
          print " "
          print "(#{make_color(@columns[col_num][position])})"
          print " "
        end
      end
      print "\n"
    end

    def add_token(column, token)
      if valid_move?(column)
        top_blank = @columns[column].find_index(&:nil?)
        @columns[column][top_blank] = token
      end
    end

    def valid_move?(column)
      if @columns[column].last == nil
        true
      else
        puts "That column is full."
      end
    end

    def winning_combination?(token)
        winning_diagonal?(token)   ||
        winning_horizontal?(token) ||
        winning_vertical?(token)
    end

    def full?
      @columns.values.flatten.all? { |token| token != nil }
        @columns.each do |col_num, column|
          return false if column.any? {|pos| pos  == nil}
        end
        return true
    end

    private

    def make_board
      columns = {}
      1.upto(7) do |i|
        columns[i] = Array.new(6)
      end
      columns
    end

    def make_color(token)
      colors = {:r => :light_red,
                     :y => :light_yellow}
      if token == nil
        "o"
      else
        "o".colorize((colors[token]))
      end
    end

    def diagonal_steps?(token, starting_column, starting_position)
      if @columns[(starting_column + 1)][(starting_position + 1)] == token &&
        @columns[(starting_column + 2)][(starting_position + 2)] == token &&
        @columns[(starting_column + 3)][(starting_position + 3)] == token ||
        @columns[(starting_column + 1)][(starting_position - 1)] == token &&
        @columns[(starting_column + 2)][(starting_position - 2)] == token &&
        @columns[(starting_column + 3)][(starting_position - 3)] == token
        return true
      end
    end

    def winning_diagonal?(token)
      @columns.each do |col_num, column|
        column.each_with_index do |blank, position|
          if col_num == 5
            return false
          elsif blank == token &&
            diagonal_steps?(token, col_num, position)
            return true
          end
        end
      end
    end

    def winning_vertical?(token)
      @columns.each do |col_num, column|
        column.each_with_index do |blank, position|
          if blank == token &&
            column[(position + 1)] == token &&
            column[(position + 2)] == token &&
            column[(position + 3)] == token
            return true
          end
        end
      end
      return false
    end

    def winning_horizontal?(token)
      @columns.each do |col_num, column|
        column.each_with_index do |blank, position|
          if col_num == 5
            return false
          elsif blank == token &&
            @columns[(col_num + 1)][position] == token &&
            @columns[(col_num + 2)][position] == token &&
            @columns[(col_num + 3)][position] == token
            return true
          end
        end
      end
    end

end
