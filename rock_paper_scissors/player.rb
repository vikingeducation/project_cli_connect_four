class Player
  attr_accessor :name, :ai


  def initialize(name, ai)
    @name = name
    @ai = ai
  end


  # get & validate input
  def get_input(player_name)
    system("clear")
    valid_inputs = %w[1 2 3]
    input = valid_inputs.sample if @ai

    loop do
      print "#{player_name.upcase}, make your selection:\n 1 for ROCK,\n 2 for PAPER, or\n 3 for SCISSORS:\n  >> "
      input = gets.chomp unless @ai
      if valid_inputs.include?(input)
        puts "Thanks!"
        break
      else
        puts "Invalid input - please try again:"
      end
    end

    input.to_i
  end

end