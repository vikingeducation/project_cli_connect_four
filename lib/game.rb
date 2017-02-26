=begin
  Public interface:
    initialize
    victory?(move)
    draw?
    two_players?
    welcome_message
    create_players
    switch_players
    introduce_players
    quit
    congratulate(name)
    ends_in_a_draw

  Test paths:
    initialize
      - verify that instance variables are correctly set

=end

module ConnectFour

  class Game
    attr_accessor :grid, :player_one, :player_two, :current_player

    def initialize(grid = nil)
      @grid = Grid.new(grid)
      @player_one, @player_two, @current_player = nil
    end

    # check if a player has made a winning move
    def victory?(move)
      grid.winning_move?(move)
    end

    # check if the game has drawn
    def draw?
      grid.full?
    end

    # check if the game is for two human players,
    # to allow us to initialize the proper player objects
    def two_players?
      puts "Is this game for two human players, or one?"
      print "Please enter either 1 or 2: "

      players = gets.chomp.downcase

      if players == 'q'
        quit_game
      else
        players = players.to_i
        until (1..2).include?(players)
          print "Invalid input. Please enter either 1 or 2: "
          players = gets.chomp
        end
      end

      puts
      players == 2 ? true : false
    end

    # prints out welcome message / instructions
    def welcome_message
      puts "Welcome to Connect Four!"
      puts "In this game, two players take turns dropping a colored marker"
      puts "into a 7 by 6 grid. Whoever manages to get 4 markers in a row"
      puts "(whether horizontally, vertically, or diagonally) wins the game!"
      puts "Hit Ctrl-C or 'q' at any time to quit."
      puts "Best of luck!"
      puts
    end

    # create the appropriate player objects, depending on
    # whether the game is two-player or single-player
    def create_players
      @player_one = Human.new("Mr Cross", "X")

      # @player_two = two_players? ? Human.new("Ms Nought", "O") : Computer.new("Skynet", "O")
      if two_players?
        @player_two = Human.new("Ms Nought", "O")
      else
        @player_two = Computer.new("Ms Nought", "O")
        @player_two.grid = @grid
      end
    end

    # switches the current player
    def switch_players
      if current_player == player_one
        self.current_player = player_two
      else
        self.current_player = player_one
      end

      puts "The current player is: #{current_player.name}."
    end

    # introduce the players - inform our players
    # about their names and markers
    def introduce_players
      puts "Player 1 is #{player_one.name}, and his marker is '#{player_one.marker}'."
      puts "Player 2 is #{player_two.name}, and his marker is '#{player_two.marker}'."
      puts
    end

    def quit
      puts "\nThank you for playing, goodbye!"
      exit
    end

    def congratulate(name)
      puts "Congratulations, #{name}! You won!"
    end

    def ends_in_a_draw
      puts "The game has ended in a draw."
    end
  end

end
