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
  # check vertical
  # check horizontal
  # check diagonal
  # end
end

class Player
  # possible turn loop here: Player checks to see if Board has completed the requsted move. #insert_coin is Boolean, until loop in Player
end

class AI
end




