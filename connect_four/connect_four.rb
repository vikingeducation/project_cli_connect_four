require_relative './lib/board.rb'
require_relative './lib/player.rb'

class ConnectFour

  def self.start_new
    puts "Would you like to play against the computer? (y/n)"
    computer_player = true if gets.strip == "y"
    player1 = Player.new("r", false)
    player2 = Player.new("y", computer_player)
    board = Board.new(5,5,player1,player2)
    while !board.finished? do
      input = board.current_player.get_input(board)

    #   # valid move?
      if !board.validate(input)
        puts "Invalid move. Please choose a column that is not full."
      else

    #   # place it in the board
        board.drop_piece(input)
    #   # display the board
        board.display_board
    # switch player
        board.switch_player
      end
    end
    #
    # puts "#{board.winner} won!"
  end

end
