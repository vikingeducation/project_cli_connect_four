class ConnectFour
end

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(7) {Array.new(0)} #7 empty columns
  end


  # Graphics
  def render
    row = 5
    7.times do |column|
      unless board[column][row].nil?
        print board[column][row]
      else
        print " "
      end
      puts ""
    end
  end

  # #Modifying the board
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
end

class AI
end




