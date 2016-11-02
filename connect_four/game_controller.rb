
class GameController

  def initialize(args = {})
    @game = args[:game] || ConnectFour
  end

  def self.play
    loop do
      game_config = get_game_options
      game = game.new(game_config)
      game.setup
      game.run      # change
      break unless play_again?
    end
  end

  def setup

  end

  protected
    attr_writer :game
  private
    attr_reader :game
end
