# Connect-four :
# 1. 2 player game
# 2. Board has 7 cols x 6 row grid
# 3. Each player takes turns to drop their unique disk in the selected column.
# 4. First player to align 4 of their disks in a line (any of the 8 possible direction) wins.

# Classes :
# 1. Player - sub - Human/AI
# 2. Board  - Has list of stacks aligned next to each other to form a grid
# 3. Stack  - Array of Disks (either "x", "o" or nil)
# 4. Disk   - belongs to a player, which has a unique marker/player.
module ConnectFour
  class Game
    def initialize
      # Instantiate the game with
      # a new board
      @board = Board.new(7, 6)
      @player1 = Player.new("X")
      @player2 = AI.new("O")
      @current_player = @player1
      @winner = nil
    end

    def play
      welcome_msg
      render
      loop do
        2.times do
          # insert disk into a column
          col_index = @current_player.insert_disk(@board)

          # render the board
          render

          # check if we have a winner
          @winner = @board.check_winner(col_index, true) if col_index

          # if we have a winner, display the winning message
          winner_msg if @winner

          # if the board is full, diplay the gameover message and exit
          game_over if @board.full?

          # if game not over, it's other player's turn
          switch_player
        end
      end
    end

    def render(opts = { clear: false })
      @board.render opts
    end

    private

    def welcome_msg
      system "clear"
      puts "Welcome to ConnectFour!"
    end

    def winner_msg
      puts "Congratualtions #{@current_player}!, You win!"
      exit
    end

    def game_over
      puts "Game is draw... board is full!"
      exit
    end

    def switch_player
      @current_player = (@current_player == @player1) ? @player2 : @player1
    end
  end
end
