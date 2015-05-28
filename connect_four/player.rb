class Player
  attr_reader :piece

  def initialize(name, piece, board)
    @name = name
    @piece = piece
    @board = board
  end


  def select_column
    user_input = nil

    loop do
      puts "#{@name}, select a column to drop into: (1 - 7)"
      user_input = gets.chomp
      if valid_integer?(user_input) && valid_range?(user_input)
        break
      else
        puts "Invalid input - please try again."
      end
    end

    @board.try_column(user_input.to_i - 1, @piece)
  end


  def valid_integer?(input)
    input.to_f == input.to_i
  end


  def valid_range?(input)
    input.to_i.between?(1, 7)
  end

end




class AIPlayer < Player

  def select_column
    preferred_move = @board.find_preferred_move

    if preferred_move.nil?
      user_input = rand(0..6)
    else
      user_input = preferred_move
    end

    @board.try_column(user_input, @piece)
  end

end