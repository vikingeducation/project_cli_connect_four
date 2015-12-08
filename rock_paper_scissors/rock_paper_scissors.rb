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
    return true if human_response == computer_response
    false
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

class Player
  ValidAnswers = %w(r p s)
end

class Human < Player

  def ask_for_response
    print "Type r, p or s then press enter (or q to quit): "
    response = gets.chomp.downcase
    until response_is_valid?(response)
      puts "Invalid decision!"
      print "Type 'r' for rock, 'p' for paper or 's' for scissors then enter (or q to quit): "
      response = gets.chomp.downcase
    end
    response
  end

  def set_mode
    print "Type 1 to play against computer or 2 to play against another person (or q to quit) and then press enter: "
    response = gets.chomp
    until mode_is_valid?(response)
      puts "Invalid decision!" 
      print "Type 1 to play against computer or 2 to play against another person (or q to quit) and then press enter: "
      response = gets.chomp
    end
    response
  end

  private

  def mode_is_valid?(response)
    exit if response == 'q'
    return true if ['1', '2'].include? response
    false
  end

  def response_is_valid?(response)
    exit if response == 'q'
    return true if ValidAnswers.include? response
    false
  end

end

class Computer < Player

  def get_response
    response = ValidAnswers[rand(3)]
  end

end

RockPaperScissors.new.start_game