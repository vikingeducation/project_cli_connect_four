=begin 

class board


  new
  enter pick
  display board
  display_board =
  render
  -----------
  test if initialize display_board has something in it

  test if when we enter a pick does the display board change and what if we give it a wrong piece or a wrong place or wrong number of arguments(error)

  
  


=end

class Board






  attr_accessor :display_board

  def initialize
    @display_board = [[],[],[],[],[],[],[],[1,2,3,4,5,6],["C","E","N","N","O","C"],["R","U","O","F","*","T"]]
  end

  def enter_pick(place, piece)
    @display_board[place-1] << piece
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