# File:           connect_four.rb
# Purpose:        Week 2 paired project for the Viking Code School - http://www.vikingcodeschool.com/week-2-ruby/building-the-game-back-ends
# Author(s):      Matthew Davis ( Github: chewieee)  
# 								Paul H. Hyman (phyman.com | GitHub: phyman) 
# Copyright:      (C) Matthew Davis && Paul H. Hyman 2014 -
# Product:        CLI version of the Connect Four game written in Ruby

#!/usr/bin/ruby

	class ConnectFourGame

		def initialize
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
				evaluate_winner
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

		def evaluate_winner
			return puts "Everyone wins if you can read this!"
		end

		def switch_player
			if @current_player == @player_1
				@current_player  = 	@player_2
			else
				@current_player  = 	@player_1
			end
		end

			
	end # ConnctFourGame
		
	
	class Board

		
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

		##
		#
		def initialize(col_num, row_num)
			puts "200"
			@col_size = col_num
			@row_size = row_num
			# puts "@col_size is #{@col_size}"
			# puts "@row_size is #{@row_size}"
			# puts "col_num is #{col_num}"
			# puts "row_num is #{row_num}"
			@playfield = Array.new(@col_size.to_i) { Array.new() }
		end

	end # Board
		
	class Player
		
	public
		attr_accessor :player_num, :piece, :board
		
		##
		#
		def drop_piece(col_num)
			if @board.verify_drop(col_num)
				@board.accept_piece(col_num, piece)
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



