class Game

  attr_accessor :player1, :player2

  def initialize
    @board = Board.new

    # assign the starting player
    @current_player = @player_x
  end

  def initial_setup
    puts "Do you want 2 players or 1 player to play against the computer?"
    puts "Enter 1 or 2"
    puts "**********************************************"

    answer = gets.chomp.strip
    if(answer == "1")
      @player1 = Player.new("Player1", :r)
      @player2 = Computer.new("Player2", :y)
    elsif(answer == "2")
      @player1 = Player.new("Player1", :r)
      @player2 = Player.new("Player2", :y)
    else 
      puts "Please ensure you enter your input correctly"
      initial_setup
    end
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

  # check_game_over?
    def check_game_over
        check_victory || check_draw
    end

    # check_draw?
    def check_draw
        if @board.full?
            puts "You've drawn!"
            true
        else
            false
        end
    end

    # check_victory?
    def check_victory
        if @board.winning_combination?(@current_player.piece)
            puts "Congratulations #{@current_player.name}, you win!"
            true
        else
            false
        end
    end


    # switch_players
    def switch_players
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player2
        end
    end
  end
end
