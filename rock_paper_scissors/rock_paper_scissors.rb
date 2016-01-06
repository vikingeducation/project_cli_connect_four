require_relative 'player'
require_relative 'computer'
require_relative 'human'

class RockPaperScissors
  GameName = "Rock! Paper! Scissors!"
  Underline = "----------------------"

  def initialize
    @human = Human.new
    @human2 = Human.new
    @computer = Computer.new
    @mode = '1'
    @wins = 0
    @losses = 0
    @draws = 0
  end

  def start_game
    puts GameName
    puts Underline
    puts "by Steven Chang"
    puts ""
    puts ""
    puts "The Rules:"
    puts Underline
    puts "ROCK beats SCISSORS"
    puts "SCISSORS beats PAPER"
    puts "PAPER beats ROCK"
    puts ""
    puts ""
    puts "\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"
    puts "IT'S TIME TO BATTLE!"
    puts "////////////////////"
    puts ""
    @mode = @human.set_mode
    if @mode == '1'
      one_player_mode
    else
      two_player_mode
    end
  end

  private

  def one_player_mode
    loop do
      puts ""
      human_response = @human.ask_for_response
      computer_response = @computer.get_response
      puts ""
      puts GameName
      puts ""
      puts "YOU ::::: #{change_response_to_word(human_response)}   #{result(human_response, computer_response)}   #{change_response_to_word(computer_response)} ::::: COMPUTER"
      puts ""
      score
      puts ""
    end
  end

  def two_player_mode
    loop do
      puts ""
      puts "PLAYER 1"
      human_response = @human.ask_for_response
      puts ""
      puts "PLAYER 2"
      human2_response = @human2.ask_for_response
      puts ""
      puts GameName
      puts ""
      puts "PLAYER 1 ::::: #{change_response_to_word(human_response)}   #{result(human_response, human2_response)}   #{change_response_to_word(human2_response)} ::::: PLAYER 2"
      puts ""
      score_for_two
      puts ""
    end
  end

  def change_response_to_word(response)
    if response == 'r'
      word = "ROCK"
    elsif response == 'p'
      word = "PAPER"
    else
      word = "SCISSORS"
    end
    word
  end

  def add_to_scoreboard(message)
    if message == "DRAW!"
      @draws += 1
    elsif message == "You LOSE!"
      @losses += 1
    else
      @wins += 1
    end
  end

  def draw?(human_response, computer_response)
    human_response == computer_response
  end

  def lose?(human_response, computer_response)
    return true if human_response == 'r' && computer_response == 'p'
    return true if human_response == 'p' && computer_response == 's'
    return true if human_response == 's' && computer_response == "r"
    false
  end

  def result(human_response, computer_response)
    if draw?(human_response, computer_response)
      message = "DRAW!"
    elsif lose?(human_response, computer_response)
      message = "You LOSE!"
    else
      message = "You WIN!"
    end
    add_to_scoreboard(message)
    message
  end

  def score
    score_board = "Wins: #{@wins} Losses: #{@losses} Draws #{@draws}"
    score_board.split('').size.times {print '='}
    puts ""
    puts score_board
    score_board.split('').size.times {print '='}
  end

  def score_for_two
    score_board = "PLAYER 1: #{@wins} PLAYER 2: #{@losses} Draws #{@draws}"
    score_board.split('').size.times {print '='}
    puts ""
    puts score_board
    score_board.split('').size.times {print '='}
  end

end

RockPaperScissors.new.start_game