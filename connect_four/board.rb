class Board

  attr_reader :winning_color, :grid, :columns

  def initialize
    @rows = [*1..6]
    @columns = [:A, :B, :C, :D, :E, :F, :G]
    @winning_color = "none"
    @current_color = "red"  #have initialize to player 1 chosen color
    @grid = create_empty_board
    @cols_dup = @columns.dup
    @rows_dup = @rows.dup
  end

  def create_empty_board
    full_grid = {}
    occupant = ["none"]
    @columns.each do | col |
      full_grid[col] = Hash[@rows.product(occupant)]
    end
    full_grid
  end

  def drop(col, color = @current_color)
    row = 1
    6.times do |i|  
      break if @grid[col][row] != "none"
      row += 1
    end
    row -= 1
    @grid[col][row] = color unless row == 0
  end

  def render
    puts "\n   1 2 3 4 5 6 7 "
    puts "  _|_|_|_|_|_|_|_"
    6.times { | row | visualize(row+1) }
    puts " |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
    puts "¯¯¯             ¯¯¯"
  end

  def tokenize(occupant)
    occ_icon = "ø" if occupant == "red"
    occ_icon = "●" if occupant == "black"
    occ_icon = "◦" if occupant == "none"
    return occ_icon
  end

  def visualize(row)  
    print " | " 
    @columns.each do | col |
      occupant = @grid[col][row]
      token = tokenize(occupant)
      print "#{token} "
    end
    puts "|"
  end

  def full?
    @rows.all? do | row |
      @columns.all? do | col |
        @grid[col][row] != "none"
      end
    end
  end

  def calc_point(direction, count)
    case direction
      when "horizontal" then @grid[@cols_dup.shift][@rows_dup[count]]
      when "vertical" then @grid[@cols_dup[count]][@rows_dup.shift]
      when "pos_diagonal" then @grid[@cols_dup.shift][@rows_dup.pop]
      when "neg_diagonal" then @grid[@cols_dup.shift][@rows_dup.shift]
    end
  end

  def winning_combo?
    directions = %w(horizontal vertical pos_diagonal neg_diagonal)
    directions.any? do | direction |
      check_for_win(direction)
    end
  end

  def check_for_win_inner(direction, count)
    subcount = 1
    in_a_row = 1
    answer = false
    @rows_dup = @rows.dup
    @cols_dup = @columns.dup
    current = calc_point(direction, count)
    direction == "horizontal" ? max = @columns.size : max = @rows.size
    until answer == true || subcount == max
      compare = calc_point(direction, count)
      if current != "none" && current == compare
        in_a_row += 1
        if in_a_row == 4
          @winning_color = current
          answer = true
          return answer
        end
      else
        in_a_row = 1
      end
      current = compare
      subcount += 1
    end
    return answer
  end

  def check_for_win(direction)
    count = 1
    answer = false
    direction == "horizontal" ? max = @rows.size : max = @columns.size
    until answer == true || count == max
      answer = check_for_win_inner(direction, count)
      count += 1
    end
    return answer
  end

end