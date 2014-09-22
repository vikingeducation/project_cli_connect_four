# File:           connect_four.rb
# Purpose:        Week 2 paired project for the Viking Code School - http://www.vikingcodeschool.com/week-2-ruby/building-the-game-back-ends
# Author(s):      Matthew Davis ( Github: chewieee)  
# 								Paul H. Hyman (phyman.com | GitHub: phyman) 
# Copyright:      (C) Matthew Davis && Paul H. Hyman 2014 -
# Product:        CLI version of the Connect Four game written in Ruby

#!/usr/bin/ruby

	class ConnectFourGame

		def initialize
			@Win_count = 4 # 4 in a row wins
			@Col_num = 7
			@Row_num = 6
			@winner_player = nil
			@board = Board.new(@Col_num, @Row_num)
		end

		def play
			set_players(get_player_count)

			loop do
				@board.render
				prompt_player_for_turn
				check_victory
				switch_player
			end
		end

		def get_player_count
			puts "How many players? (1-2)"
			num_players = gets.chomp.to_i
			# validate player count
			if num_players < 1 || num_players > 2
				puts "Please choose 1 or 2 players\n\n"
				get_player_count()
			end  
			return num_players
		end

		def set_players(player_count)
			@player_1 = Player.new(@board, 1, "1")

			if player_count == 1
				@player_2 = AI.new(@board, 2, "2")
			else
				@player_2 = Player.new(@board, 2, "2")
			end

			@current_player = [@player_1, @player_2].sample
		end

		##
		# * Will prompt the player for a move
		# * The board will check if the move is valid
		# * If a valid move then triggers the player to 
		# * 	drop the piece
		#
		def prompt_player_for_turn
			puts "It is Player #{@current_player.player_num}'s turn"
			puts "Which column would you like to drop your piece?"
			puts "Columns are 1-#{@Col_num.to_i}"
			plyr_col_num = gets.strip.to_i # get input from player
			
			# check the board if this is a vaild play
			if @board.verify_drop(plyr_col_num)	
				@current_player.drop_piece(plyr_col_num)
			else
				puts "This column is full, please select another column"
				prompt_player_for_turn # play isn't valid recursive call
			end

		end

		def check_game_over
			check_victory || check_draw
		end

		def check_victory
			if winning_combination?
				puts "Congratulations #{@current_player.player_num}, you win!"
				true
			else
				false
			end
		end

		def check_draw
			if @board.full?
				puts "The gameboard is full, it's a draw."
				true
			else
				false
			end
		end

		def switch_player
			if @current_player == @player_1
				@current_player  = 	@player_2
			else
				@current_player  = 	@player_1
			end
		end

		def winning_combination?
			winning_diagonal?		||
			winning_horizontal?	||
			winning_vertical?
		end

		def winning_diagonal?
			# check if are four in a row on any verticals
			return diag_pieces_in_a_row(@Win_count)
		end

		def winning_vertical?
      # check if are four in a row on any verticals
      return vert_pieces_in_a_row(@Win_count)
    end

    def winning_horizontal?
      # check if are four in a row on any horizontals
      return horz_pieces_in_a_row(@Win_count)
    end
			
	end # ConnctFourGame
		
	
	class Board

		##
		#
		def initialize(col_num, row_num)
			@col_size = col_num
			@row_size = row_num
			@playfield = Array.new(@col_size.to_i) { Array.new() }
		end

		
		##
		#
		def render()
			@playfield.each { |x| p x }
		end 

		##
		#
		def get_playfield()
			# pass the playfield back to the caller
			return @playfield
		end

		##
		#
		def verify_drop(col_num)
			ret_val = false
			if (1..col_num).include?(col_num) && space?(col_num)
				ret_val = true
			end
			return ret_val
		end

		##
		#
		def space?(col_num)
			@playfield[(col_num - 1)].size < @row_size
		end
		
		def accept_piece(col_num, piece)	
			@playfield[col_num - 1] << piece
		end

		def full?
			@playfield.all? do |row|
				row.none?(&:nil?)
			end
		end

		def diag_pieces_in_a_row?(piece_count)
			# check if there are {piece_count} 
			# number of pieces in a diagonal row
			return false
		end

		# game's X rows
		def vert_pieces_in_a_row?(piece_count)
        # check if there are {piece_count} 
        # number of pieces in a vertical row
        # verticals.any? do |vert|
        #     vert.include
        # end
    end

    # game's Y columns
    def horz_pieces_in_a_row?(piece_count)
        # check if there are {piece_count} 
        # number of pieces in a horizontal row
        horizontals.any? do |horz|
            horz.all?{|cell| cell == @current_player.piece }
        end
    end

    def verticals
        # return the vertical pieces
        @board
    end

    # horizontals
    def horizontals
        # return the horizontal pieces
        horizontals = []
        6.times do |i|
            horizontals << [@board.get_playfield[0][i],@board[1][i],@board[2][i],@board[3][i],@board[4][i],@board[5][i],@board[6][i]]
        end
        horizontals
    end

	end # Board
		
	class Player
		
	public
		attr_accessor :player_num, :piece, :board
		
		##
		#
		def drop_piece(col_num)
			if @board.verify_drop(col_num)
					@board.accept_piece(col_num, piece) @board[col_num] << piece
			end
		end
		
		def initialize(board, player_number = 9, piece = "$")
			@player_num = player_number
			@piece = piece
			@board = board
		end

	end # end Player
			
	class AI < Player
		
		# def initialize(player_num = 9, piece = "$", board)
			# 
		# end		

	end # end AI

game = ConnectFourGame.new
game.play



