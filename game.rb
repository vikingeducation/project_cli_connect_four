module ConnectFour

  class Game
    def initialize
      @grid = Grid.new
      @player_red, @player_yellow, @current_player = nil

    end

    # main game method
    def play
      setup_game
      run_game
    end

    private

    attr_accessor :grid, 
                  :current_player, 
                  :player_red, 
                  :player_yellow


    # helper method for game setup
    def setup_game
      welcome_message
      create_players
      switch_players
    end

    # helper method for main game loop
    def run_game
      until draw?
        begin
          column = current_player.ask_for_column
          move = grid.place_marker(column, current_player.marker)
          grid.render

          # check for victory condition..
          if victory?(move)
            congratulate(current_player.name)
            
            # we could ask if the players want to try again..
            quit_game
          end

          switch_players
        rescue Interrupt
          quit_game
        end
      end

      # draw condition..
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

      players = gets.chomp.to_i
      until (1..2).include?(players)
        print "Invalid input. Please enter either 1 or 2: "
        players = gets.chomp.to_i
      end

      puts

      players == 2 ? true : false
    end

    # create the appropriate player 
    def create_players
      @player_red = Human.new("Mr Red", "R")

      @player_yellow = two_players? ? Human.new("Ms Yellow", "Y") : Computer.new("Ms Yellow", "Y")
    end

    # switches the current player
    def switch_players
      if current_player == player_red
        self.current_player = player_yellow
      else
        self.current_player = player_red
      end
    end

    # prints out welcome message / instructions
    def welcome_message
      puts "Welcome to Connect Four!"
      puts "In this game, two players take turns dropping a colored marker"
      puts "into a 7 by 6 grid. Whoever manages to get 4 markers in a row"
      puts "(whether horizontally, vertically, or diagonally) wins the game!"
      puts
      puts "Best of luck!"
      puts
    end

    def quit_game
      puts "\nThank you for playing, goodbye!"
      exit
    end

    def congratulate(name)
      puts "Congratulations, #{name}! You won!"
    end
  end

end

if $0 == __FILE__
  require_relative 'grid'
  require_relative 'player'
  require_relative 'human'
  require_relative 'computer'

  include ConnectFour

  game = Game.new
  game.play
end
