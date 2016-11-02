
class GameController

  def initialize(args = {})
    @game  = args[:game]   || ConnectFour
    @view  = args[:view]   || GameView
  end

  def self.play
    loop do
      game_config = get_game_options
      current_game = game.new(game_config)
      view.welcome(game.name, game.instructions)
      turn_loop(current_game)
      break unless play_again?
    end
  end

  def turn_loop(game)
    loop do
      current_game.render
      current_game.turn
    end
  end

  protected
    attr_writer :game
  private
    attr_reader :game, :view
end
