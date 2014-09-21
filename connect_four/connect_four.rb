# File:           connect_four.rb
# Purpose:        Week 2 paired project for the Viking Code School - http://www.vikingcodeschool.com/week-2-ruby/building-the-game-back-ends
# Author(s):      Matthew Davis ( Github: chewieee)  
# 								Paul H. Hyman (phyman.com | GitHub: phyman) 
# Copyright:      (C) Matthew Davis && Paul H. Hyman 2014 -
# Product:        CLI version of the Connect Four game written in Ruby

#!/usr/bin/ruby

	class ConnectFourGame

		@col_num = 7
		@row_num = 6


		def initialize
			@board = Board.new(@col_num, @row_num)
		end

		def play
			set_players(get_player_count)

			loop do
				@board.render
				prompt_player_for_turn
				@current_player.drop_piece
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
			@player_1 == Player.new( )

			if player_count == 1
				@player_2 == AI.new
			else
				@player_2 == Player.new( )
			end

			@current_player = [@player_1, @player_2].sample
		end

		def prompt_player_for_turn
			# 
	

		end

		def evaluate_winner


		end

		def switch_player
			if @current_player == @player_1
				@current_player = @player_2
			else
				@current_player = @player_1
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
			if (1..@col_num).include?(col_num) && space?(col_num)
				ret_val = true
			end
			return ret_val
		end

		##
		#
		def space?(col_num)
			@playfield[col_num].size < row_num
		end
		
		##
		#
		def initialize(col_num, row_num)
			@col_num = col_num
			@row_num = row_num
			@playfield = Array.new(@col_num.to_i) { Array.new(@row_num.to_i) }
		end

	end # Board
		
	class Player
		
		##
		#
		def drop_piece(col_num)
			if @board.verify_drop(col_num)
				@board[col_num] << piece 
			end
		end
		
		def initialize(player_num = 9, piece = "$", board)
			@player_num = player_num
			@piece = piece
			@board = board
		end

	end # end Player
			
	class AI < Player
		

		def initialize(player_num = 9, piece = "$", board)
			
		end		

	end # end AI

game = ConnectFourGame.new
game.play



