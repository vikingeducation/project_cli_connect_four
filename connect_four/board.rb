class Board

  attr_accessor :display_board

  def initialize
    @display_board = [[],[],[],[],[],[],[]]
  end

  def enter_pick(place, piece)
    @display_board[place] << piece
  end

  def render
    counter = 5
    while counter >= 0
      @display_board.each do |col|
        if col[counter] == nil
          print " - "
        else
          print " #{col[counter]} "
        end
        print "|"
      end
      print "\n"
      counter -= 1
    end
  end






end