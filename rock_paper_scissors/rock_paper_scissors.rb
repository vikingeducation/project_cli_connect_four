class RockPaperScissors
  GameName = "Rock! Paper! Scissors!"
  Underline = "----------------------"

  def initialize
    @human = Human.new
    @computer = Computer.new
    @human_response = nil
    @computer_response = nil
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
    begin_round
  end

  private

  def begin_round
    @human_response = @human.ask_for_response
    @computer_response = @computer.get_response
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