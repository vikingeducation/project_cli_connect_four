class Board

  attr_reader :state

  def initialize(state = [[],[],[],[],[],[]])
    @state = []
    state.each do |col|
      @state << col.dup
    end
  end

  def move(args)
    @state[args[0]] << args[1]
  end

  # Returns the winner, or NIL if there is no winner
  def winner
    # Horizontal
    0.upto(5) do |row|
      0.upto(2) do |col|
        if (@state[0 + col][row] == @state[1 + col][row]) &&
        (@state[0 + col][row] == @state[2 + col][row]) &&
        (@state[0 + col][row] == @state[3 + col][row])
          return @state[col][row] unless @state[col][row].nil?
        end
      end
    end

    # Vertical
    0.upto(5) do |col|
      0.upto(2) do |row|
        if (@state[col][0 + row] == @state[col][1 + row]) &&
          (@state[col][0 + row] == @state[col][2 + row]) &&
          (@state[col][0 + row] == @state[col][3 + row])
          return @state[col][row] unless @state[col][row].nil?
        end
      end
    end

    # Bottom left to upper right
    0.upto(2) do |row|
      0.upto(2) do |col|
        if (@state[col][row] == @state[1 + col][1 + row]) &&
          (@state[col][row] == @state[2 + col][2 + row]) &&
          (@state[col][row] == @state[3 + col][3 + row])
          return @state[col][row] unless @state[col][row].nil?
        end
      end
    end

    # Upper left to lower right
    5.downto(3) do |row|
      0.upto(2) do |col|
        if (@state[col][row] == @state[col + 1][row - 1]) &&
          (@state[col][row] == @state[col + 2][row - 2]) &&
          (@state[col][row] == @state[col + 3][row - 3])
          return @state[col][row] unless @state[col][row].nil?
        end
      end
    end

    return nil
  end

  def full?
    return @state.reduce(0){|acc, col| acc += col.length} == 36
  end

  def display
    puts ""
    puts ""
    5.downto(0) do |idx|
      0.upto(5) do |pos|
        @state[pos][idx]? (print "#{@state[pos][idx]}") : (print " ")
      end
      puts ""
    end
  end

  def col_full?(col_no)
    @state[col_no].length > 5
  end
end

