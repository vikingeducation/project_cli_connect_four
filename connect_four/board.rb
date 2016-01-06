
require "./disk"

class Board
  NUM_ROWS = 6
  NUM_COLS = 7

  def initialize
    @board = Array.new(NUM_ROWS) { Array.new(NUM_COLS) }
  end

  def render
    puts
    (NUM_ROWS - 1).downto 0 do | i |
      @board[i].each do |square|
        if square.nil?
          print "o "
        else
          print "#{square.owner} "
        end
      end
      puts
    end
    puts
  end


  def valid_move?(player_input)
    @board[NUM_ROWS - 1][player_input - 1].nil? ? true : false
  end

  def place_disk ( disk, column )
    ( 0...NUM_ROWS ).each do | row |
      if !@board[row][column]
        @board[row][column] = disk
        break
      end
    end

  end

  def end_conditions?()

  end

end
