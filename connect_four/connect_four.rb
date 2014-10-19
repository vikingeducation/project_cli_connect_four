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
				break if check_victory
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
			@player_1 = Player.new(@board, 1, "赤")

			if player_count == 1
				@player_2 = AI.new(@board, 2, "黄")
			else
				@player_2 = Player.new(@board, 2, "黄")
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

			@current_player.get_player_response


		end

		def check_game_over
			check_victory || 
			check_draw
		end

		def check_victory
			if winning_combination?
				@board.render
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
			return @board.diag_pieces_in_a_row?(@Win_count, @current_player.piece)
		end

		def winning_vertical?
      # check if are four in a row on any verticals
      return @board.vert_pieces_in_a_row?(@Win_count, @current_player.piece)
    end

    def winning_horizontal?
      # check if are four in a row on any horizontals
      return @board.horz_pieces_in_a_row?(@Win_count, @current_player.piece)
    end
			
	end # ConnctFourGame
		
	
	class Board

		attr_reader :col_size, :row_size
		
		##
		#
		def initialize(col_num, row_num)
			@col_size = col_num
			@row_size = row_num
			@playfield = Array.new(@col_size.to_i) { Array.new() }
		end

		
		##
		#
		def render
		   puts "\e[H\e[2J"
		   puts "\t+++++++ Connect Four ++++++++"
		   puts "\n\n\n"
		   5.downto(0) do |row|
		   	print "\t"
		     (0..6).each do |col|
		       if @playfield[col][row]
		         print "| #{@playfield[col][row]}"
		       else
		         print "|   "
		       end
		     end
		     puts "|\n"
		     puts "\t" + "-" * 29
		   end
		   print "\t  " 
		   (1..7).each {|i| print i.to_s.ljust(4)}

		   puts " "
		   puts " "
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
			if  valid_column?(col_num) && space?(col_num)
				ret_val = true
			end
			return ret_val
		end

		def valid_column?(col_num)
			if (1..@col_size).include?(col_num) 
				true
			else
				puts "That is not a valid column. Please select another column."
				false
			end
		end
		##
		#
		def space?(col_num)
			if @playfield[(col_num - 1)].size < @row_size
				true
			else
				puts "This column is full, please select another column."
				false
			end
		end
		
		def accept_piece(col_num, piece)	
			@playfield[col_num - 1] << piece
		end

		def full?
			@playfield.all? do |row|
				row.none?(&:nil?)
			end
		end

		def diag_pieces_in_a_row?(piece_count, piece)
			# check if there are {piece_count} 
			# number of pieces in a diagonal row
			diagonals.any? do |diag|
				if diag.size > 3
					diag.join('').include?((piece * piece_count))
				end
			end
		end

		# game's X rows
		def vert_pieces_in_a_row?(piece_count, piece)
        # check if there are {piece_count} 
        # number of pieces in a vertical row
        verticals.any? do |vert|
            vert.join('').include?((piece * piece_count))
          end
    end

    # game's Y columns
    def horz_pieces_in_a_row?(piece_count, piece)
        # check if there are {piece_count} 
        # number of pieces in a horizontal row
        horizontals.any? do |horz|
           horz.join('').include?((piece * piece_count))
        end
    end

    def diagonals
    	[@playfield, @playfield.map(&:reverse)].inject([]) do |all_diags, matrix|
      ((-matrix.count + 1)..matrix.first.count).each do |offet_index|
        diagonal = []
        (matrix.count).times do |row_index|
          col_index = offet_index + row_index
          diagonal << matrix[row_index][col_index] if col_index >= 0
        end
        all_diags << diagonal.compact if diagonal.compact.count > 1
      end
      all_diags
    end
    end
    
    def verticals
        # return the vertical pieces
        @playfield
    end

    # horizontals
    def horizontals
        # return the horizontal pieces
        horizontals = []
        6.times do |i|
            horizontals << [@playfield[0][i],@playfield[1][i],@playfield[2][i],@playfield[3][i],@playfield[4][i],@playfield[5][i],@playfield[6][i]]
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
					@board.accept_piece(col_num, piece)
			end
		end
		
		def initialize(board, player_number = 9, piece = "$")
			@player_num = player_number
			@piece = piece
			@board = board
		end

		def get_player_response
			@plyr_col_num = gets.strip.to_i # get input from player
			take_turn
		end

		def take_turn
			# check the board if this is a vaild play
			if @board.verify_drop(@plyr_col_num)	
					drop_piece(@plyr_col_num)
			else
				get_player_response # play isn't valid recursive call
			end
			
		end

	end # end Player
			
	class AI < Player
		
		##
		#
		def drop_piece(col_num)
			if @board.verify_drop(col_num)
					@board.accept_piece(col_num, piece)
			end
		end

		def get_player_response
			@plyr_col_num = rand(1...@board.col_size)
			take_turn
		end

	end # end AI

## ---------------------------------------------------------------
## ---------------------------------------------------------------	

game = ConnectFourGame.new
game.play



