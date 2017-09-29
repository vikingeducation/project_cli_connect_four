require 'pry'
require_relative 'human_player'
require_relative 'computer_player'
require_relative 'board'

class Game
  attr_accessor :board, :player_1, :player_2, :turn
  attr_reader :player_1_piece, :player_2_piece

  def initialize
    @board = Board.new
    @player_1_piece = 'R'
    @player_2_piece = 'B'
    @turn = 1
  end

  def greeting
    puts "**Welcome to Connect Four!"
    puts "Enter 1 for a one player game or 2 for a two player game."
  end

  def create_players
    game_type = gets.chomp.to_i
    if game_type == 1
      self.player_1 = HumanPlayer.new
      self.player_2 = ComputerPlayer.new
    else
      self.player_1 = HumanPlayer.new
      self.player_2 = HumanPlayer.new
    end
  end

  def current_player(turn)
    turn.odd? ? player_1 : player_2
  end

  def current_player_piece
    turn.odd? ? player_1_piece : player_2_piece
  end

  def prompt_for_move
    puts "Enter the slot in which you'd like to drop your game piece:"
  end

  def full_column
    puts "That colum is already full; selct another:"
    current_player(turn).make_move
  end

  def win?
    win_horizontal? || win_vertical? || win_diagonal?
  end

  def play 
    greeting
    create_players
    prompt_for_move
    column = current_player(turn).make_move
    puts board.win_diagonal?(current_player_piece)
    while @board.update_board(column, current_player_piece) == 0
      column = full_column
    end
    self.turn += 1
    board.display_board
    prompt_for_move
    column = current_player(turn).make_move
    board.update_board(column, current_player_piece)
    self.turn += 1
    board.display_board
  end
end

Game.new.play