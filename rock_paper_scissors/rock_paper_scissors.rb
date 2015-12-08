class RockPaperScissors
  GameName = "Rock! Paper! Scissors!"
  Underline = "----------------------"

  def initialize
    @human = Human.new
    @computer = Computer.new
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
    play
  end

  private

  def play
    loop do
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
    puts "Wins: #{@wins} Losses: #{@losses} Draws #{@draws}"
    score_board.split('').size.times {print '='}
    puts ""
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

  private

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