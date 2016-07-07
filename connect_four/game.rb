module ConnectFour
  class Game
    def initialize(rows,columns)
      @board = Board.new(rows,columns)
      welcome_message
      initialize_players
    end 

    def welcome_message
      puts "Welcome to connect four. How many players?"
    end

    def initialize_players
      input = gets.chomp
      if input == "1"
        @player1 = Human.new(1)
        @player2 = Computer.new(2)
      elsif input == "2"
        @player1 = Human.new(1)
        @player1 = Human.new(2)
      else
        puts "Please enter '1' or '2'."
        initialize_players
      end
    end

    def play
      until game_over?
        @board.render
        @player_1.turn
        break if game_over?
        @player_2.turn
        break if game_over?
      end
    end

    def game_over?
      win? || full?
    end

    def win?
    end

    def full?
    end

# Classes: Player, Human, Computer, Game, Board, Column
# Board: 7 across, 6 up

# Board should be an array of arrays of Columns

# Player: initialize, get_move
# Human: valid_move? prompt
# Computer: print_choice
# Game: Initialize, play, win?, full?, game_over?
# Board: render, add_piece(location)
# Column: initialize, show



  end
end