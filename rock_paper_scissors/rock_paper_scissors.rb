require "./player.rb"

class RockPaperScissors

  def initialize
    @player_one = Player.new("Player One", false)
    @player_two = Player.new("Player Two", false)
  end


  def play
    # choose single or multiplayer
    @player_two.ai = true if enable_ai?


    # prompt players for input
    input_one = @player_one.get_input(@player_one.name)
    input_two = @player_two.get_input(@player_two.name)

    input_one_name = input_names(input_one)
    input_two_name = input_names(input_two)


    # compare choices
    system("clear")
    puts "#{@player_one.name} throws #{input_one_name}...#{@player_two.name} throws #{input_two_name}..."
    comparison = compare_inputs(input_one, input_two)

    # declare winner
    declare_winner(input_one_name, comparison)
  end


  def enable_ai?
    puts "Play single player against AI? (y/n)"
    gets.downcase.chomp == "y"
  end


  def compare_inputs(one, two)
    case one * two
    when 2
      "PAPER beats ROCK..."
    when 3
      "ROCK beats SCISSORS..."
    when 6
      "SCISSORS beats PAPER..."
    else
      "It's a draw!"
    end
  end


  def declare_winner(input_name, winning_phrase)
    puts winning_phrase

    if winning_phrase == "It's a draw!"
      puts "Nobody wins...you should play again!"
    elsif winning_phrase[0] == input_name[0]
      puts "#{@player_one.name.upcase} WINS!"
    else
      puts "#{@player_two.name.upcase} WINS!"
    end
  end


  def input_names(input_number)
    names = %w[ROCK PAPER SCISSORS]
    names[input_number - 1]
  end

end




r = RockPaperScissors.new
r.play