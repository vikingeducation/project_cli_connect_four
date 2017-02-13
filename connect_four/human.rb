require_relative 'machine'
require_relative 'player'
require_relative 'board'

class Human < Player
  attr_reader  :second_player
  def initialize(name, token, board)
    @name = name
    @token = token
    @board = board
  end

def get_drop_column
    loop do
        drop = ask_for_drop_column
        if validate_drop_column_format(drop)
          @board.drop = drop
          @board.token = @token
            if @board.add_token
                break
            end
        end
    end
end

def ask_for_drop_column
    puts "#{@name}, please enter your column:"
    gets.chomp.to_i - 1
end

def validate_drop_column_format(drop)
    if (drop >= 0) && (drop <= 6)
        true
    else
        puts "Your column is invalid.  Please enter a valid column number"
    end
end

end
