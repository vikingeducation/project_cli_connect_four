class Player
  
  attr_reader :name, :color, :won

  def initialize(name, color)
    @name = name
    @color = color
    @won = false
  end

  def get_move(board)
    puts "#{@name}, please enter the number of the column in which you want to drop your token."
    print "> "
    input = gets.strip.to_i
    if !valid?(input, board)
      puts "\nMove not valid. Try again!" 
      get_move(board)
    else
      translate(input, board)
    end
  end

  def translate(input, board)
    board.columns[[*1..7].find_index(input)] if [*1..7].include?(input)
  end

  def valid?(input, board)
    !translate(input, board).nil? && board.grid[translate(input, board)][1] == "none"
  end
  
  def turn(board)
    board.drop(get_move(board), @color)
  end

  def congratulate
    @won = true
    puts "\nCongrats, #{@name}, you won!\n\n"
  end

end