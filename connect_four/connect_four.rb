#!/usr/bin/env ruby

require_relative "player"
require_relative "board"
require_relative "render"

class ConnectFour
  def initialize
    @board = Board.new
    @player1 = Player.new
    @player2 = Player.new
    @player1.piece = "X"
    @player2.piece = "O"
    play
  end

  def play
    Render.board(@board.rows)
    begin
      @current_player = switch_player
      begin
        placement = player_pick(@current_player)
      end until valid_play?(placement) 
      Render.board(@board.rows)
    end until game_end?(placement)
    declare_winner(@board.win(placement))
  end

  def declare_winner(piece)
    if piece == @player1.piece
      Render.winner("Player 1")
    else
      Render.winner("Player 2")
    end
  end

  def switch_player
    case @current_player
    when @player1
      @player2
    else
      @player1
    end
  end

  def valid_play?(move)
    !!move
  end

  def player_pick(player)
    begin
      move = player.placement
    end until (0...@board.board.length).include?(move)
    @board.add_piece(move, player.piece)
  end

  def game_end?(coords)
    @board.winner?(coords) || @board.full?
  end
end

ConnectFour.new