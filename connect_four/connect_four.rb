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
    until game_end?
      @board.add_piece(@player1.placement, @player1.piece)
      Render.board(@board.rows)
    end
  end

  def game_end?
    @board.winner? || @board.full?
  end
end

ConnectFour.new