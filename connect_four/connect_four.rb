class ConnectFour

def initialize
  @board = Board.new
  @player_one = Player.new()
  @player_two = Player.new()
end

# Play
def play
#   Welcome_display
#   until board_is_full?
#     render the board
#     Ask player for movement
#      HumanPlayer.new.get_position - ask player for movement
#       is_there_winner?
#         winner_looser_message
#       draw_message if board_is_full?
#     Switch players
#     end

def welcome_display
  puts "
  ____                            _     _____
 / ___|___  _ __  _ __   ___  ___| |_  |  ___|__  _   _ _ __
| |   / _ \\| '_ \\| '_ \\ / _ \\/ __| __| | |_ / _ \\| | | | '__|
| |__| (_) | | | | | | |  __/ (__| |_  |  _| (_) | |_| | |
 \\____\\___/|_| |_|_| |_|\\___|\\___|\\__| |_|  \\___/ \\__,_|_|"
 puts
 puts
 puts "ABOUT THE GAME"
 puts "This game is similar to the classic tic-tac-toe game, the primary difference being that in this game players must connect four of their pegs in a straight line, either horizontally, vertically or diagonally."
 puts "The player takes turns with the other player or computer to drop pegs into slots within the grid. The first one to connect four slots in a line wins."
 puts
 puts
end

def is_there_winner?
  #checks if the game is won and who is the winner
  #are diagonals, horizontals, verticals in four
end

def is_there_draw?

end

def winner_looser_message
  #display message for the winner and looser
end
# def winner_or_draw
# => is_there_draw? || is_there_winner?
#end


def draw_message
  #displays message when the board is ful and noone won
end

def switch_players
  #changes turns of the players
end


end

class HumanPlayer
  initilize pieces
  initialize board

  def get_position

    is_valid_position?
    is_valid_input

  end

  def is_valid_position?
    #can player move his piece there?
  end

  def is_valid_input?
    #correctly input
  end

end

class Board

def initialize
  @board = Array.new(7){Array.new(6)}
def render
  #displays the current board
end

def is_board_full?
  #are there any free spaces left
end

def add_pegs

end

def is_peg_location_available?

end

def is_peg_location_on_board

end

def is_it_winning_combination

end

def is_it_winning_diagonal?

end

def is_it_winning_vertical?

end

def is_it_winning_horizontal?

end

end
