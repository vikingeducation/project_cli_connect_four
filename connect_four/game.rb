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

  def prompt_for_move
    puts "Enter the slot in which you'd like to drop your game piece:"
  end

  def play 
    greeting
    create_players
    prompt_for_move
    column = current_player(turn).make_move
    self.turn += 1
    @board.update_board(column)
    @board.display_board
    prompt_for_move
    column = current_player(turn).make_move
    self.turn += 1
    @board.update_board(column)
    @board.display_board
  end
end

Game.new.play