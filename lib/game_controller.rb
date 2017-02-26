module ConnectFour
  
  # Created this class to abstract out the main game loop,
  # so that we could easily test the interface that the 
  # Game class exposes.
  #
  # This also allows us to (hopefully) switch out GameControllers
  # in the future.

  class GameController
    attr_reader :game

    def initialize(grid = nil)
      @game = Game.new(grid)
    end

     # main game method
    def play
      setup_game
      run_game
    end

    # helper method for game setup
    def setup_game
      game.welcome_message
      game.create_players
      game.introduce_players
      game.switch_players
    end

    # helper method for main game loop
    def run_game
      until game.draw?
        begin
          column = game.current_player.choose_column

          game.quit if column == 'q'

          until game.grid.valid_move?(column)
            puts "That column is full. Please try again."
            column = game.current_player.choose_column
          end

          move = game.grid.place_marker(column, game.current_player.marker)
          
          game.grid.render

          game.current_player.grid = game.grid

          if game.victory?(move)
            game.congratulate(game.current_player.name)
            
            game.quit
          end

          game.switch_players
        rescue Interrupt
          game.quit
        end
      end

      game.ends_in_a_draw
      game.quit
    end
  end

end

if $0 == __FILE__
  require_relative 'player'
  require_relative 'human'
  require_relative 'computer'
  require_relative 'grid'
  require_relative 'game'

  include ConnectFour

  GameController.new.play
end