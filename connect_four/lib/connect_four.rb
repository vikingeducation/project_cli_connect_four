=begin
 public : play, 
 private : @board, introduction, instruction, type_of_game, create_game, loop_game
=end

require_relative "board"
require_relative "player"
require_relative "human"
require_relative "ai"

class ConnectFour
  def initialize
    @board = Board.new
  end

  def play
    introduction

    create_game( type_of_game )

    current_player = @player1

    loop_game current_player
    
    @board.render
    puts "\nIt's a Tie ! The board is full !\n\n"
  end

private
  def introduction
    puts "
    =====================================================
    This is the Connect-Four Game !
    You have to connect four disks before your opponent !
    =====================================================
    "
  end


  def instruction
    puts "Choose one colunm to put your disk from 1 to 7 (  example:   3 )
    "
  end

  def create_game type
    @player1 = Human.new 'Player1', :X
    if type == 1
      @player2 = Ai.new 'Player2', :O
    else
      @player2 = Human.new 'Player2', :O
    end
  end


  def loop_game current_player
    loop do 
      @board.render
      instruction
      puts "#{current_player.name}, it's your turn !\n"

      move = 0
      loop do 
        move = current_player.make_move
        break if @board.move( move, current_player.symbol )
      end

      if @board.victory?( move, current_player.symbol )
        victory current_player
      end
      current_player = switch_player current_player
    end
  end

  def victory current_player
    @board.render
      puts "#{current_player.name}, You Just Won !\n\n"
      exit
  end


  def type_of_game
    input = false
    until [1,2].include?(input)
      puts "Who is your opponent? 1 for Computer, 2 for Human player !"
      input = gets.chomp.to_i
    end
    input
  end


  def switch_player current_player
    current_player == @player1 ? (current_player = @player2) : (current_player = @player1)
    current_player
  end

end


#game = ConnectFour.new
#game.play