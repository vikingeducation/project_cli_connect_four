=begin
  Tests player
  1. init
  Public Methods Human
  1.  get name
  2. get move
  Private Methods Human
  1.  valid_move_input_format
  Tests Human
  1. init
  2. get name
  3. get move
    valid input
    invalid input

    Pulic Methods Machine
    1. get move
    Private Methods Machine
    1. win_block
    Tests Machine
    1. init
    2. get move
      win
      block
      random move
=end

class Player
  attr_accessor :token, :name

  def initialize(token)
    @token  = token
  end
end

class Human < Player
  def initialize(token)
    super(token)
  end

  def get_name
    puts "What's your name?"
    @name = gets.chomp
  end

  def get_move(board)
    puts "#{@name}, please enter your column:"
    loop do
      col_num = gets.chomp.to_i
      break if valid_move_input_format?(col_num) && board.add_token(col_num, @token)
    end
  end

  private

  def valid_move_input_format?(col_num)
    if (1..7).include?(col_num)
      return true
    else
      puts "Invalid input.  Please enter a number between 1 and 7."
    end
  end

end

class Machine < Player
  def initialize(token)
    super(token)
    @name = "Conrad"
  end

  def get_move(board)
    win = win_block(:y, board)
    block = win_block(:r, board)
    move = win || block || (1..7).to_a.sample
    board.add_token(move, @token)
  end

  private

  def win_block(token, board)
    1.upto(7) do |col_num|
      test_board = Marshal::load(Marshal.dump(board))
      test_board.add_token(col_num, token)
      if test_board.winning_combination?(token)
        return col_num
      else
        next
      end
    end
    return false
  end
end
