# Game
# - match draw (when board full)
# - win condition
# - player turn logic

class Game
  def initialize(attr = {})
    @playerRed = attr[:playerRed]
    @playerBlue = attr[:playerBlue]
    @board = attr[:board]
    @turnCount = 1 # Odd for red, Even for Blue, at 43 game over
    @win = false
  end

  def play
    
  end
end