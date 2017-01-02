module Connect_Four
class Game

  attr_accessor :player1, :player2

  def initialize
    @board = Board.new
  end

  def initial_setup
    puts "Do you want 2 players or 1 player to play against the computer?"
    puts "Enter 1 or 2"
    puts "**********************************************"

    answer = gets.chomp.strip
    if(answer == "1")
      @player1 = Player.new("Player1", :r, @board)
      @player2 = Computer.new("Computer", :y, @board)
    elsif(answer == "2")
      @player1 = Player.new("Player1", :r, @board)
      @player2 = Player.new("Player2", :y, @board)
    else 
      puts "Please ensure you enter your input correctly"
      initial_setup
    end
    
    # assign the starting playerr
    @current_player = @player1
  end

  def play
    puts "Welcome to Connect 4"
    puts "**********************************************"

    initial_setup

    loop do
       @board.render
        @current_player.get_coordinates

        break if check_game_over

        switch_players
    end
  end

  def check_game_over
      check_victory || check_draw
  end

  def check_draw
      if @board.full?
          puts "You've drawn!"
          true
      else
          false
      end
  end

  def check_victory
      if @board.winning_combination?(@current_player.piece)
          puts "Congratulations #{@current_player.name}, you win!"
          true
      else
          false
      end
  end

  def switch_players
    if @current_player == @player1
        @current_player = @player2
    else
        @current_player = @player1
    end
  end
end
end