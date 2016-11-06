
class ConnectFourController

  QUIT_OPTIONS = %w(q quit Q exit)

  def initialize(args = {})
    @game  = args[:game]        || ConnectFour
    @player_1 = args[:players]  || HumanPlayer.new(piece: "X")
    @player_2 = nil
    @active_player = nil
    @view  = args[:view]        || GameView
  end

  def play
    loop do
      current_game = game.new
      view.welcome(game.name, current_game.instructions)
      set_players
      turn_loop(current_game)
      current_game.render
      view.end_message(current_game.win?)
      break unless play_again?
    end
  end

  def turn_loop(game)
    loop do
      game.render
      self.active_player = get_active_player
      player_move = get_player_move(active_player, game)
      game.add_piece(player_move, active_player.piece)
      break if game.over?
    end
  end

  def set_players
    view.pick_players_prompt
    choice = player_1.get_input
    if choice.to_i == 1
      self.player_2 = ComputerPlayer.new(piece: "O")
    elsif choice.to_i == 2
      self.player_2 = HumanPlayer.new(piece: "O")
    else
      view.player_default_message
      self.player_2 = HumanPlayer.new(piece: "O")
    end
  end

  def get_player_move(player, game)
    player_input = ""
    loop do
      view.print_player_move_prompt(active_player.piece)
      player_input = player.get_move
      quit if QUIT_OPTIONS.include?(player_input)
      break if game.valid_move?(player_input)
      view.print_invalid_input
    end
    player_input.to_i
  end

  protected
    attr_writer :active_player, :game, :player_2
  private
    attr_reader :active_player, :game, :view, :player_1, :player_2

    def get_active_player
      active_player == player_1 ? player_2 : player_1
    end

    def play_again?
      view.print_play_again_prompt
      player_input = active_player.get_input
      player_input == "y" ? true : false
    end

    def quit
      exit
    end
end
