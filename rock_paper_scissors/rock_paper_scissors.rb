class RockPaperScissors
  attr_reader :player_quits, :player, :ai
  attr_accessor :player_one_wins

# Set up the game initially
  def initialize
    @player_quits = false
    @player_one_wins = false
    @player = Player.new
    @ai = AI.new
    play
  end

  def play
    until player_quits
      player_move = player.ask_for_player_choice
      ai_move = ai.ask_for_ai_move
      if is_draw?(player_move,ai_move)
        puts "It's a draw"
      else
        pick_winner(player_move,ai_move)
        display_winner_message ai_move
      end
      ask_player_to_continue
    end
  end

  def pick_winner(move1,move2)
    case
    when move1 == "R" && move2 == "S"
      self.player_one_wins = true
    when move1 == "S" && move2 == "P"
      self.player_one_wins = true
    when move1 == "P" && move2 == "R"
      self.player_one_wins = true
    else
      self.player_one_wins = false
    end
  end

  def is_draw?(move1,move2)
    move1 == move2
  end


  def ask_player_to_continue
    puts "Enter 'q' to quit, or anything else to play again: "
    quit_prompt = gets.chomp.upcase
    @player_quits = (quit_prompt == 'Q')
  end

  def display_winner_message player_two_move
    puts "Player two chose #{player_two_move}"
    if player_one_wins
      puts "Player one wins!"
    else
      puts "Player two wins!"
    end
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