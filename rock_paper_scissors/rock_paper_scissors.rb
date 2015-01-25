require './ai.rb'
require './player.rb'

class RockPaperScissors
  attr_reader :player_quits, :player_one, :player_two
  attr_accessor :player_one_wins

# Set up the game initially
  def initialize
    @player_quits = false
    @player_one_wins = false
    @player_one = Player.new(1)
    puts "Welcome to Rock Paper Scissors!"
    puts "One player or two?"
    number_of_players = gets.chomp.to_i

    if number_of_players == 1
      @player_two = AI.new
    else
      @player_two = Player.new(2)
    end

    play
  end

  private

  def play
    until player_quits
      player_one_move = player_one.move
      player_two_move = player_two.move
      if is_draw?(player_one_move,player_two_move)
        puts "It's a draw"
      else
        pick_winner(player_one_move,player_two_move)
        display_winner_message player_two_move
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
end