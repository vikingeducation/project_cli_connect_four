require_relative 'machine'
require_relative 'player'
require_relative 'board'

class Human < Player
  attr_reader  :second_player, :name, :token
  def initialize(name, token, board)
    @name = name
    @token = token
    @board = board
  end

def get_drop_column
    loop do
        drop = ask_for_drop_column
        if legal_move(drop)
          @board.drop = drop
          @board.token = @token
          @board.add_token
          break
        else
          puts "Your column is invalid.  Please enter a valid column number"
        end
    end
end

def ask_for_drop_column
    puts "#{@name}, please enter your column:"
    gets.chomp.to_i - 1
end

def legal_move(drop)
  if (drop >= 0) && (drop <= 6)
    return (@board.board_state[0][drop]).nil?
  else
    return false
  end
end

end
