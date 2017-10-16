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

  #private

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

  def current_player
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
    current_player.make_move(current_player_piece, board.board, board.diagonals)
  end

  def win?
    board.win_horizontal?(current_player_piece) || 
    board.win_vertical?(current_player_piece) || 
    board.win_diagonal?(current_player_piece)
  end

  def game_loop
    loop do
      prompt_for_move
      column = current_player.make_move(current_player_piece, board.board, board.diagonals)
      while @board.update_board(column, current_player_piece) == 0
        column = full_column
      end
      board.display_board
      break if board.full? || win?
      self.turn += 1
    end
  end

  def display_outcome
     if board.full?
      puts "It's a tie!"
    else
      puts "Winner!!!"
    end
  end

  public

  def play 
    greeting
    create_players
    board.display_board
    game_loop
    display_outcome
  end
end
