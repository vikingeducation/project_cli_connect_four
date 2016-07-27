# Your code here!
require_relative 'board.rb'
require_relative 'player.rb'
require 'pry'


class ConnectFive
    # initialize
    def initialize
        # set up the board
        @board = Board.new

        # set up the players
        @player_x = Player.new("Madame O", :O, @board)
        @player_y = Player.new("Mister X", :X, @board)

        # assign the starting player
        @current_player = @player_x
    end

    # play
    def play

        # loop infinitely
        loop do
            # call the board rendering method
            @board.render

            # ask for coordinates from the current player
            @current_player.get_coordinates

            # check if game is over
            break if check_game_over

            # switch players
            switch_players
        end
    end

    # check_game_over?
    def check_game_over
        # check for victory
        # check for draw
        check_victory || check_draw
    end

    # check_victory?
    def check_victory
      # binding.pry
        # IF Board says current player's piece has
        # a winning_combination?
        if @board.winning_combination?(@current_player.piece)
            # then output a victory message
            puts "Congratulations #{@current_player.name}, you win!"
            true
        else
            false
        end
    end

    # check_draw?
    def check_draw
        # If Board says we've filled up
        if @board.full?
            # display draw message
            puts "Bummer, you've drawn..."
            true
        else
            false
        end
    end

    # switch_players
    def switch_players
        if @current_player == @player_x
            @current_player = @player_y
        else
            @current_player = @player_x
        end
    end

end

new_game = ConnectFive.new
new_game.play
