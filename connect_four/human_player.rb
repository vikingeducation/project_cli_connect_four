class HumanPlayer
  attr_accessor :peg_symbol, :board, :name

  def initialize(name, peg_symbol ,board)
    raise "Peg has to be a string" unless peg_symbol.is_a? (String)
    @name = name
    @peg_symbol = peg_symbol
    @board = board
  end

  def get_col_guessed
    loop do
      col_guessed = ask_for_col_guessed.to_i
      if @board.is_valid_input?(col_guessed)
        if @board.can_drop_peg_here?(col_guessed)
          @board.add_pegs(col_guessed, peg_symbol)
          break
        end
      else
        puts "Please provide correct number of the column!"
      end
    end
  end

  def ask_for_col_guessed
    puts
    puts
    puts "#{@name}, Please type a number of the column you wish to drop your peg in #{@peg_symbol}"
    gets.strip.to_i
  end

end