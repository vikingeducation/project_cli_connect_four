
class GameController

  def initialize(args = {})
    @game = args[:game] || ConnectFour
  end

  def self.play
    loop do
      game = game.new
      game.setup
      game.run
      break unless play_again?
    end
  end

  protected
    attr_writer :game
  private
    attr_reader :game
end
