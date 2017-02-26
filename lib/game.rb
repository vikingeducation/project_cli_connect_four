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

    victory?
      - returns true if last move won the game
      - returns false otherwise

    draw?
      - returns true if the game grid is full
      - returns false otherwise

    two_players?
      - returns true if player inputs the integer 2
      - returns false otherwise

    create_players
      - check that player objects are correctly initialized

    switch_players
      - check that @current_player is correctly switched between @player_one and @player_two

    quit
      - check that SystemExit is raised
=end

module ConnectFour

  class Game
    attr_accessor :grid,
                  :player_one,
                  :player_two,
                  :current_player

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
      num_players = nil
      puts "Is this game for two human players, or one?"
      loop do
        print "Please enter either 1 or 2: "
        num_players = gets.chomp.to_i

        break if (1..2).include?(num_players)

        puts "Your input is invalid, please try again."
      end

      num_players == 2 ? true : false
    end

    # create the appropriate player objects, depending on
    # whether the game is two-player or single-player
    def create_players
      @player_one = Human.new("Mr Cross", "X")

      if two_players?
        @player_two = Human.new("Ms Nought", "O")
      else
        @player_two = Computer.new("Skynet", "O")
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

    # quits the game
    def quit
      puts "\nThank you for playing, goodbye!"
      exit
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

    # introduce the players - inform our players
    # about their names and markers
    def introduce_players
      puts "Player 1 is #{player_one.name}, and his marker is '#{player_one.marker}'."
      puts "Player 2 is #{player_two.name}, and his marker is '#{player_two.marker}'."
      puts
    end

    # prints a congratulatory message for the winning player
    def congratulate(name)
      puts "Congratulations, #{name}! You won!"
    end

    # prints a message indicating the game has ended in a draw
    def ends_in_a_draw
      puts "The game has ended in a draw."
    end
  end

end
