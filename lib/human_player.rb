class HumanPlayer
  attr_accessor :peg_symbol, :board, :name

  def initialize(name, peg_symbol ,board)
    raise "Peg has to be a string" unless peg_symbol.is_a? (String)
    @name = name
    @peg_symbol = peg_symbol
    @board = board
  end

  def get_col_guessed(column=nil)
    loop do
      col_guessed = column ||= ask_for_col_guessed.to_i
      if @board.is_valid_input?(col_guessed) &&  @board.can_drop_peg_here?(col_guessed)
          @board.add_pegs(col_guessed, peg_symbol)
          break
      elsif
        puts "Please choose a correct column number, this one is either full or doesn't exist!"
      end
    end
  end

  private

  def ask_for_col_guessed
    puts
    puts
    puts "#{@name}, Please type a number of the column you wish to drop your peg in #{@peg_symbol}"
    gets.strip.to_i
  end

end