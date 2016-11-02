
class ConnectFourGameController

  def initialize(args = {})
    @game  = args[:game]                  || ConnectFour
    @player_1, @player_2 = args[:players] || [HumanPlayer.new(piece: "X"),
                                              HumanPlayer.new(piece: "O")]
    @view  = args[:view]                  || GameView
  end

  def self.play
    loop do
      current_game = game.new
      view.welcome(game.name, game.instructions)
      turn_loop(current_game)
      break unless play_again?
    end
  end

  def turn_loop(game)
    loop do
      active_player = get_active_player 
      current_game.render
      view.print_player_move_prompt

    end
  end

  protected
    attr_writer :game
  private
    attr_reader :game, :view

    def get_active_player
      player_1 ? player_2 : player_1
    end
end
