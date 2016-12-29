class Board
  attr_reader :data, :winning_color

  def initialize
    @board = Array.new(6) { Array.new(7,"\u25CB ") }
    @data = Array.new(6) { Array.new(7, 0) }
    @winning_color = nil
  end

  def update_board!(move, player_color) 
    @data.each_with_index do |row, row_num|
      if row[move-1] == 0
        row[move-1] = update_data(player_color)
        @board[row_num][move-1] = render_disc(player_color)
        break
      end
    end
  end

  def render
    puts "-------------------"
    @board.reverse.each_with_index do |row, row_number|
      print " #{(row_number-6).abs} | "
      row.each { |col| print col }
      puts
    end
    puts "==================="
    puts "     1 2 3 4 5 6 7"
    puts "-------------------"
  end

  def win_on_board?
    return true if vertical_win_on_board? || horizontal_win_on_board? || diagonal_win_on_board?
    false
  end

  private 

  # check each cell in first 3 rows across all columns for vertical win (in up direction)
  # unnecessary to check last 3 rows b/c a vertical 4-in-a-row detected in first 3 rows overlaps
  # with one that would be detected in last 3 rows
  def vertical_win_on_board?
    @data[0..2].each_with_index do |row, y|
      row.each_with_index do |column, x|
        return true if vertical_win_up_direction?(x, y)
      end
    end
    false
  end

  # check each cell in first 4 columns across all rows for horizontal win (in right direction)
  # unnecessary to check last 3 rows (same reasoning as for vertical case)
  def horizontal_win_on_board?
    @data.each_with_index do |row, y|
      row[0..3].each_with_index do |column, x|
        return true if horizontal_win_right_direction?(x,y)
      end
    end
    false
  end

  # check each cell in first 3 rows and first 4 columns for diag win (in up right direction)
  # check each cell in first 3 rows and last 4 colums for diag win (in up left direction)
  def diagonal_win_on_board?
    @data[0..2].each_with_index do |row, y|
      row[0..3].each_with_index do |column, x|
        return true if diagonal_win_up_right_direction(x,y)
      end
      row[3..6].each_with_index do |column, x|
        return true if diagonal_win_up_left_direction(x+3,y)
      end
    end
    false
  end

  # check if (x, y) --> (x, y+3) has same values [vertical up direction ONLY]
  # sum of 4 => red player win, sum of -4 => yellow player win
  def vertical_win_up_direction?(x,y)
    sum = @data[y][x] + @data[y+1][x] + @data[y+2][x] + @data[y+3][x]
    check_for_win_and_update_winner(sum)
  end

  # check if (x, y) --> (x+3, y) has same values [horizontal right direction ONLY]
  def horizontal_win_right_direction?(x,y)
    sum = @data[y][x] + @data[y][x+1] + @data[y][x+2] + @data[y][x+3]
    check_for_win_and_update_winner(sum)
  end

  # check if (x, y) --> (x+3, y+3) has same values [diagonal up right direction]
  def diagonal_win_up_right_direction(x,y)
    sum = @data[y][x] + @data[y+1][x+1] + @data[y+2][x+2] + @data[y+3][x+3]
    check_for_win_and_update_winner(sum)
  end

  # check if (x, y) --> (x-3, y+3) has same values [diagonal up left direction]
  def diagonal_win_up_left_direction(x,y)
    sum = @data[y][x] + @data[y+1][x-1] + @data[y+2][x-2] + @data[y+3][x-3]
    check_for_win_and_update_winner(sum)
  end

  def check_for_win_and_update_winner(sum)
    if sum.abs == 4
      sum > 0 ? @winning_color = 'red' : @winning_color = 'yellow'
      return true
    end
    false
  end

  def update_data(player_color)
    player_color == 'red' ? 1 : -1 
  end

  def render_disc(player_color)
    player_color == 'red' ? "\e[31m#{"\u25CF"}\e[0m "  : "\e[33m#{"\u25CF"}\e[0m "
  end
end



