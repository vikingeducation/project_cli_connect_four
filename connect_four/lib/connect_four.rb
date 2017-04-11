 # Your code here!

=begin

Public interface:

:current_player (reader)
initialize
play

=Private methods=

instructions
game_over?
victory?
draw?
switch_players

=Paths=

  initialize:
    -test if instance variables get created correctly

  play:
    -test if the game loop runs properly

  instructions:
    -print instructions correctly

  game_over?
    -returns true if there's a victory/draw?

  victory?
    -returns true, prints a winner message, if the last move makes a row for the current player

  draw?
    -returns true if the board is full, false if not

  switch_players
    -correctly switches between players

=end

class ConnectFour

  attr_reader :current_player

  def initialize

    @grid = Grid.new

    @player_1 = Player.new("Player 1", :X, @grid)
    @player_2 = Player.new("Player 2", :O, @grid)

    @current_player = @player_1

  end

  def play

    instructions
    loop do 
      @grid.render     
      @current_player.get_choice 
 
      break if game_over?

      switch_players

    end

  end

  private

  def instructions
    
    puts
    puts "=== Welcome to Connect Four! ==="
    puts
    puts "To win Connect Four you must be the first player"
    puts "to get four of your discs in a row,"
    puts "either horizontally, vertically or diagonally."
    puts
    puts "Player 1, your discs are represented by an X."
    puts "Player 2, your discs are represented by an O."
    puts 
    puts "Let's get started!"
    puts

  end

  def game_over?

    victory? || draw?

  end

  def victory?

    if @grid.winner?(@current_player.disc)
      @grid.render
      puts
      puts "#{@current_player.name} wins. Congrats!"
      puts
      true
    else
      false
    end

  end

  def draw?
    
    if @grid.full?
      puts "It's a draw."
      true
    else
      false
    end

  end

  def switch_players

    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end

  end

end