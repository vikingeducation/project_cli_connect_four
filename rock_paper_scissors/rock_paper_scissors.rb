class RockPaperScissors

  def initialize
    puts "Welcome to Rock Paper Scissors game"

    @player_1 = Player.new("Player 1")

    if one_player?
      @player_2 = AIGameplay.new
    else
      @player_2 = Player.new("Player 2")
    end
    keep_playing = true
      while keep_playing
        take_turn
        keep_playing = play_again?
      end

    puts "Play again later! Bye."
  end


  def take_turn
    move_1 = @player_1.turn
    move_2 = @player_2.turn
    puts "Player 1 chose #{move_1} and player 2 chose #{move_2}"
    compare_move(move_1, move_2)
  end


  def one_player?
    print "Would you like to play (1) against the AI, or (2) multiplayer? "
    is_valid = false
    until is_valid
      input = gets.chomp
      is_valid = is_1_or_2?(input)
      print "Please enter 1 for solo and 2 for multiplayer: " unless is_valid
    end
    input == "1"
  end


  def is_1_or_2?(input)
    ["1","2"].include?(input)
  end


  def play_again?
    is_valid = false
    until is_valid
      print "Do you want to play again? (Y/N): "
      input = gets.chomp.downcase
      is_valid = is_true_or_false?(input)
      puts "Try 'y' or 'n'" unless is_valid
    end
    return input == "y"
  end


  def is_true_or_false?(input)
    ["y", "n"].include?(input)
  end


  def compare_move(move1, move2)
    if move1 == move2
      puts "You tied against player 2!"
    elsif player1_win?(move1, move2)
      puts "Player 1 wins!"
    else
      puts "Player 2 wins!"
    end
  end


  def player1_win?(move1, move2)
    (move1 == "r" && move2 == "s") ||
    (move1 == "p" && move2 == "r") ||
    (move1 == "s" && move2 == "p")
  end


end



class Player

  def initialize(name)
    @name = name
  end

  def turn
    is_valid = false
    until is_valid
      print "#{@name} - Enter your move ([R]ock, [P]aper, or [S]cissors): "
      input = gets.chomp.downcase
      is_valid = is_input_valid?(input)
      puts "Please enter 'r' 'p' or 's' to play" unless is_valid
    end
    return input
  end

  def is_input_valid?(input)
    ["r", "p", "s"].include?(input)
  end

end



class AIGameplay
  def turn
    ["r", "p", "s"].sample
  end

end
