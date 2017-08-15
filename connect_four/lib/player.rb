class Player
  attr_reader :color, :is_computer

  def initialize(color, is_computer)
    @color = color
    @is_computer = is_computer
  end

  def get_input(board)
    if is_computer == false
      get_human_input(board)
    else
      get_computer_input(board)
    end
  end

private

  def get_human_input(board)
  #   # get the right user's input
    puts "#{board.current_player.color} enter a column:"
    input = gets.strip.to_i - 1
  end

  def get_computer_input(board)
    guess = rand(0..board.width - 1)
    until board.validate(guess)
      guess = rand(0..board.width - 1)
    end
    puts "#{board.current_player.color} chose #{guess + 1}"
    guess
  end


end
