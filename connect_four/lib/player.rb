=begin
Public Methods
  initialize
    Player should have a name and a pice
  name
    return name
  piece
    return piece
  get_input
    return an input which is an Integer and in valid range (1-7)

Private Methods
  ask_for_input
  valid_input?

=end


class Player
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end

  def get_input(board)
    loop do
      input = ask_for_input
      if valid_input?(input, board)
        return input
        break
      end
      puts "Invalid Input"
    end
  end
  
  private

  def ask_for_input
    puts "Where do you want to move your piece #{name} (columns 1-7) ?"
    gets.chomp.to_i
  end

  def valid_input?(input, board)

    !board.column_full?(input-1)
  end


end

