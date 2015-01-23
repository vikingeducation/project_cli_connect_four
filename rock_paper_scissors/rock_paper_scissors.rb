class RockPaperScissors
  attr_reader :player_quits
  attr_accessor :player_one_wins

# Set up the game initially
  def initialize
    @player_quits = false
    @player_one_wins
    @player = Player.new
    @ai = AI.new
    play
  end

  def play
    until player_quits
      player_move = player.ask_for_player_choice
      ai_move = ask_for_ai_move
      if is_draw?(player_move,ai_move)
        puts "It's a draw"
      else
        pick_winner(player_move,ai_move)
      end

    end
  end

  def pick_winner(move1,move2)
    case
    when move1 == "R" && move2 == "P"
      player_one_wins == false
    when move1 == "R" && move2 == "S"
  end

  def is_draw?(move1,move2)
    move1 == move2
  end
# Compare the moves to declare a winner
# Ask if player wants to play again.
#   If yes, loop to beginning.
#   Else, exit game.
end

class Player
  attr_accessor :choice

  def ask_for_player_choice
    self.choice = nil
    until valid_input?
      print "Choose rock ('R'), paper ('P') or scissors ('S')\n > "
      self.choice = gets.chomp.upcase
      unless valid_input?
        print "That's not an allowed move!\n"
      end
    end
    self.choice
  end

  def valid_input?
    ["R","P","S"].include? self.choice
  end
end

class AI
  def ask_for_ai_move
    ["R","P","S"].sample
  end
end