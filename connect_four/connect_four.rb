require_relative "prompt"

class ConnectFour

  def initialize
    # @board_instance = Board.new
    # @red = Player.new
    # @black = Player.new
  end

  def run
    unless win? || draw? 
      input = Prompt.get_input
      @board_instance.update_board(input)
    end
  end

  def win? 
    false
  end

  def draw? 
    false
  end

  # run
    # show board    
      # board => display 
    # loop until win or draw
      # ask for user move
      # validate user move (legal move)
        # out of bounds/board
        # out of top/no more space in col
      # update board
      # show board
        # board => display
  # check for win
    # horizontal 
    # vertical 
    # diagonal 
end

# test
t = ConnectFour.new
t.run 

