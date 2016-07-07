require_relative "player.rb"
require_relative "board.rb"

class Game

  def initialize(num_of_players)
    @board = Board.new
    @view = @board.display_board
    if num_of_players == 1
      @player1 = Human.new("B")
      @player2 = Computer.new("R")
    elsif num_of_players == 2
      @player1 = Human.new("B")
      @player2 = Human.new("R")
    end
    @current_player = @player1
  end

  def game_loop
    welcome
    until horizontal_win?
      turn
      assign_player
    end
    final_message
  end

  def welcome
    puts "Welcome to Connect4."
  end

  def turn
    @board.render
    player_pick = @current_player.pick
    @board.enter_pick(player_pick, @current_player.piece)
  end

  def assign_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def game_over?
    if win? || tie?
      true
    else
      false
    end
  end

  def final_message
    if win?
      "Some player won" #determine who wins
    elsif tie?
      "The game is a tie."
    end
  end

  def win?
    if horizontal_win? || vertical_win? || diagonal_win?
      true
    else
      false
    end
  end

  def horizontal_win?
    @view.each do |column|
      column.each_with_index do |spot, index|
        if [spot, column[index+1], column[index+2], column[index+3]] == ["B","B","B","B"] ||
          [spot, column[index+1], column[index+2], column[index+3]] == ["R","R","R","R"]
          true
        else
          false
        end
      end
    end
  end

  def vertical_win?
    @view.each_with_index do |column, col_index|
      column.each_with_index do |spot, index|
        if [@view[col_index+1][index], @view[col_index+2][index], @view[col_index+3][index], spot] == ["B","B","B","B"] ||
          [@view[col_index+1][index], @view[col_index+2][index], @view[col_index+3][index], spot] == ["R","R","R","R"]
          true
        else
          false
        end
      end
    end
  end

  def diagonal_win?
    false
  end

  def tie?
    false
  end


end