class Board
  
  @@COLS = 7
  @@ROWS = 6

  def initialize
    @game_board = Array.new(6){Array.new(7)}
  end

  def render
	  @game_board.each do |row|
      row.each do |piece|
        print "  O  " if piece == nil
      end
      puts
    end
  end


end	