class ConnectFour
end

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(7) {Array.new(0)} #7 empty columns
  end

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

  def column_is_full?(column)
    board[column].length == 6
  end

  def insert_coin(column, player_id)
    if column_is_full?(column)
      puts "Error: The column is full! Please choose another column"
      # Note: Account for looping issues
    else
      board[column] << player_id
    end
  end

  # # Winning conditions

  def vertical_win?
    #check all columns
    #board[0..3] #to board[2..5]
    board.each do |column|
        0.upto(2) do |row|
          test_array = column[row..(row+3)]
          return true if winning_array?(test_array)
        end
    end
    false
  end

  def horizontal_win?
    #check between rows
  end
  # check diagonal
  # end

  def winning_array?(array)
    !array.include?(nil) && array.uniq.length == 1
  end

end

class Player
  # possible turn loop here: Player checks to see if Board has completed the requsted move. #insert_coin is Boolean, until loop in Player
end

class AI
end




