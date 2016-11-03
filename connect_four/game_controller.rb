
class ConnectFourController

  def initialize(args = {})
    @game  = args[:game]   || ConnectFour
    @view  = args[:view]   || GameView
  end

  def self.play
    loop do
      current_game = game.new
      view.welcome(current_game.name, current_game.instructions)
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
