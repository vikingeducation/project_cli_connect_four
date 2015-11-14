class Human < Player

  def initialize(board, symbol)
    super(board, symbol)
    @name = get_name
    puts "Welcome, #{@name}. Your game piece is '#{symbol}'."
  end

  def get_move
    loop do
      move = ask_move
      if valid_format?(move)
        break if @board.place_move(move, @symbol)
      end
    end
  end

  private

  def get_name
    puts "Welcome, new player!  What is your name?"
    gets.chomp.capitalize
  end

  def ask_move
    print "Enter move (#{@name}) > "
    gets.chomp.to_i
  end

  def valid_format? move
    (1..7).include?(move) ? true : puts("I'm sorry, I don't recognize that column. Try again...")
  end

end