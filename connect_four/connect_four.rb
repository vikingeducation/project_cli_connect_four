
require_relative "board"
require_relative "player"
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
    if type == 1
      @player1 = Player.new 'Player1', :X
      @player2 = Ai.new 'Player2', :O
    else
      @player1 = Player.new 'Player1', :X
      @player2 = Player.new 'Player2', :O
    end
  end


  def loop_game current_player
    while !@board.full?
      @board.render
      instruction
      puts "#{current_player.name}, it's your turn !\n"

      move = current_player.make_move
      if @board.move_possible? move

        @board.make_move( move, current_player.symbol )

        if @board.victory?( move, current_player.symbol )
          @board.render
          puts "#{current_player.name}, You Just Won !\n\n"
          exit
        end
        current_player = switch_player current_player
      end
    end
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


game = ConnectFour.new
game.play