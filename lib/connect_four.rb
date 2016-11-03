

require_relative "player"
require_relative "board"
require_relative "render"

class ConnectFour
  attr_reader :board, :player1, :player2
  def initialize (computer = false, auto_play = true)
    @board = Board.new
    @player1 = Player.new
    @player2 = (computer ? Computer.new(@board) : Player.new)
    @player1.piece = "X"
    @player2.piece = "O"
    auto_play ? play : nil
  end

  def play
    Render.board(board.rows)
    begin
      current = switch_player(current)
      move = get_move(current)
      Render.board(board.rows)
    end until game_end?(move)
    declare_winner(board.win(move))
  end

  private

    def get_move(player)
      begin
        Render.placement
        move = player.placement
        placement = board.add_piece(move, player.piece)
      end until valid?(placement)
      placement
    end

    def declare_winner(piece)
      if piece == player1.piece
        Render.winner("Player 1")
      else
        Render.winner("Player 2")
      end
    end

    def game_end?(coords)
      board.winner?(coords) || board.full?
    end

    def switch_player(current_player)
      case current_player
      when player1
        player2
      else
        player1
      end
    end

    def valid?(move)
      !!move
    end
end