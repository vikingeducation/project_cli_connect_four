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

		def initialize(args)
		
			@board = Board.new(@col_num,@row_num)

		end
			
	end # ConnctFourGame
		
	
	class Board

		##
		#
		def render()
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
			@playfield = Array.new(@col_num) { Array.new(@row_num) }
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