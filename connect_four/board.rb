class Board
  attr_accessor :board

  def initialize
    @board = Array.new(7) {Array.new(0)} #7 empty columns
  end

  # Graphic methods
  def render
    puts "\n   1 2 3 4 5 6 7"
    5.downto 0 do |row|
      print "  |"
      0.upto 6 do |column|
        if board[column][row].nil?
          print " |"
        else
          print board[column][row]
          print "|"
        end
      end
      print "\n"
    end
    print "   1 2 3 4 5 6 7\n\n"
  end

  def insert_coin(column, player_id)
    if column.nil?
      false
    elsif column_is_invalid?(column)
      puts "Error: That is not a correct column."
      false
    elsif column_is_full?(column)
      puts "Error: The column is full! Please choose another column"
      false
    else
      board[column] << player_id
      true
    end
  end

  def win?
    # Checks vertical, horizontal, and diaogonal victory conditions
    vertical_win? ||
    horizontal_win? ||
    up_diagonal_win? ||
    down_diagonal_win?
  end

  def full?
    board.each do |column|
      return false if column.length < 6
    end
    return true
  end

  private

  def column_is_full?(column)
    board[column].length == 6
  end

  def column_is_invalid?(column)
    !(0..6).include? column
  end

  def vertical_win?
    board.each do |col|
      0.upto(2) do |row|
        test_array = [ col[row],
                       col[row+1],
                       col[row+2],
                       col[row+3] ]
        return true if winning_array?(test_array)
      end
    end
    false
  end

  def horizontal_win?
    row = 0
    while row < 7 do
      0.upto(3) do |col|
        test_array = [ board[col][row],
                       board[col+1][row],
                       board[col+2][row],
                       board[col+3][row] ]
        return true if winning_array?(test_array)
      end
      row += 1
    end
    false
  end

  def up_diagonal_win?
    col = 0
    while col < 4 do
      0.upto(2) do |row|
        test_array = [ board[col][row],
                       board[col+1][row+1],
                       board[col+2][row+2],
                       board[col+3][row+3] ]
        return true if winning_array?(test_array)
      end
      col += 1
    end
    false
  end

  def down_diagonal_win?
    col = 0
    while col < 4 do
      5.downto(3) do |row|
        test_array = [ board[col][row],
                       board[col+1][row-1],
                       board[col+2][row-2],
                       board[col+3][row-3] ]
        return true if winning_array?(test_array)
      end
      col += 1
    end
    false
  end

  def winning_array?(array)
    # If there are any nils, that indicates an empty "spot"
    # A winning row will consist of the same values, and
    # therefore uniq.length will return 1
    !array.include?(nil) && array.uniq.length == 1
  end
end