require "rainbow/ext/string"
require_relative "prompt"
require_relative "player"
require_relative "display"
require_relative "board"

class ConnectFour

  def initialize
    @board = Board.new
    @p1 = Player.new(:r)
    @p2 = Player.new(:b)
  end

  def run
    Display.instructions
    Display.render_board(@board.board)
    @current_player = @p2

    until win? || draw?
      @current_player = (@current_player == @p1) ? @p2 : @p1
      input = Prompt.get_input
      if @board.valid_move?(input)
        @board = @board.update(input, @current_player.color)
      else
        Display.invalid_input
      end
    end 

    Display.game_won(@current_player.color) if win?
    Display.game_draw(@current_player.color) if draw?
    play_again?
  end 

  def win?
    @board.horizontal_win? || @board.vertical_win? || @board.diagonal_win?
  end

  def draw?
    @board.full?
  end

  def play_again?
    Display.ask_replay
    replay = Prompt.get_replay
  end

end

# test
t = ConnectFour.new
t.run