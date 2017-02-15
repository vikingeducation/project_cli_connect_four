module ConnectFour

  class Game
    def initialize
      @grid = Grid.new
      @player_red, @player_yellow, @current_player = nil

    end

    # main game method
    def play
      welcome_message

      # display current state of game grid
      grid.render

      create_players
      switch_players
    end

    # check if the game is over
    def game_over?
      victory? || draw?
    end

    # check if a player has made a winning move
    def victory?
    end

    # check if the game has drawn
    def draw?
    end

    # check if the game is for two human players,
    # to allow us to initialize the proper player objects
    def two_players?
    end

    # create the appropriate player 
    def create_players
      @player_red = Human.new

      @player_yellow = two_players? ? Human.new : Computer.new
    end

    # switches the current player
    def switch_players
      if current_player == player_red
        self.current_player = player_yellow
      else
        self.current_player = player_red
      end
    end

    private

    attr_accessor :grid, 
                  :current_player, 
                  :player_red, 
                  :player_yellow

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