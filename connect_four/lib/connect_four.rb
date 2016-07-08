=begin 

class connect_four
    
  new(num_of_players)
  play
  welcome
  turn
  assign_player
  game_over?
  final_message
  win?
  vertical_win?
  horizontal_win?
  diagonal_win?
  tie?
-------------------

  test if initialize creates a new board(if board has something)

  does view have the board in it
  tests number of players to see if it makes a computer or human
  test that it sets current player
  initiates a turn counter


=end



require_relative "player.rb"
require_relative "board.rb"

class Game

  attr_accessor :board

  BWIN = ["B","B","B","B"]
  RWIN = ["R","R","R","R"]

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
    @turn_counter = 0
  end

  def play
    welcome
    until win? == true
      turn
      assign_player
      @turn_counter += 1
    end
    @board.render
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
    if win? == true || tie? == true
      return true
    else
      return false
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
    if horizontal_win? == true || vertical_win? == true || diagonal_win? == true
      return true
    else
      return false
    end
  end

  def vertical_win?
    @view.each do |column|
      column.each_with_index do |spot, index|
        if [spot, column[index+1], column[index+2], column[index+3]] == BWIN ||
          [spot, column[index+1], column[index+2], column[index+3]] == RWIN
          return true
        end
      end
    end
  end

  def horizontal_win?
    counter = 0
    while counter <= 6
      @view[counter].each_with_index do |spot, index|
        if [@view[counter+1][index], @view[counter+2][index], @view[counter+3][index], spot] == BWIN ||
          [@view[counter+1][index], @view[counter+2][index], @view[counter+3][index], spot] == RWIN
          return true
        end
      end
      counter += 1
    end
  end

  def diagonal_win?
    counter = 0
    while counter <= 6
      @view[counter].each_with_index do |spot, index|
        if [@view[counter+1][index+1], @view[counter+2][index+2], @view[counter+3][index+3], spot] == BWIN ||
          [@view[counter+1][index+1], @view[counter+2][index+2], @view[counter+3][index+3], spot] == RWIN ||
          [@view[counter+1][index-1], @view[counter+2][index-2], @view[counter+3][index-3], spot] == BWIN ||
          [@view[counter+1][index-1], @view[counter+2][index-2], @view[counter+3][index-3], spot] == RWIN
          return true
        end
      end
      counter += 1
    end
  end

  def tie?
    if @turn_counter >= 42
      return true
    else
      false
    end
  end


end