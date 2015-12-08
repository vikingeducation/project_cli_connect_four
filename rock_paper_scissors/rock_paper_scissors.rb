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

  def result(human_response, computer_response)
    if human_response == 'r'
      if computer_response == 'r'
        message = "DRAW!"
        @draws += 1
      elsif computer_response == 'p'
        message = "You LOSE!"
        @losses += 1
      else
        message = "You WIN!"
        @wins += 1 
      end
    elsif human_response == 'p'
      if computer_response == 'r'
        message = "You WIN!"
        @wins += 1
      elsif computer_response == 'p'
        message = "DRAW!"
        @draws += 1
      else
        message = "You LOSE!"
        @losses += 1
      end
    else
      if computer_response == 'r'
        message = "You LOSE!"
        @losses += 1
      elsif computer_response == 'p'
        message = "You WIN!"
        @wins += 1
      else
        message = "DRAW!"
        @draws += 1
      end
    end
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
    response = ValidAnswers.shuffle[0]
  end

end

RockPaperScissors.new.start_game