class Board
  def initialize
    @board = Array.new(6) { Array.new(7) }
  end

  def render

    (@board.length - 1).downto 0 do | i |
      @board[i].each do |square|
        if square.nil?
          print "o "
        else
          #print square.color
        end
      end
      puts
    end
    puts
  end


  def valid_move? (player_input)
    true
  end

end
