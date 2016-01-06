require_relative 'board.rb', 'player.rb'

class ConnectFour

  def initialize
    @board = Board.new
    @board.setup
  end

  def play_connect_four
    display_instructions
    opponent_prompt
    color_prompt

    
        #Render board
        #Ask for inputs
        #Validate
        #Check win/draw
      #End loop
  end

  def display_instructions

  end

  def opponent_prompt

  end

  def color_prompt

  end

end