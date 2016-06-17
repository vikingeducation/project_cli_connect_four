
class ConnectFour



def initialize

	@board = default_state
	# get num_players
	# creating the player and/or CPU
	if num_players == 1
		@player1 = Player.new( "Player 1", :R )
		@player2 = CPU.new( "Computer", :B )
	# call
	else
		@player1 = Player.new( "Player 1", :R )
		@player2 = Player.new( "Player 2", :B )
	end


	@current_player = @player1

	run

end

def num_players
	# prompt to start games and generate player/cpu
	begin

		Board.message(%q(How many players? Enter: 1 or 2))
		input = gets.strip.to_i

  end until input == 1 || input == 2

	return input

end


def run

	Board.render( @board )

	@current_player.get_move

end
# the game will handle

# setting up the game board
def default_state

	# hash for the rows
	return { 1 => ["[", "O", "O", "O", "O", "O", "O", "O", "]"						], 2 => ["[", "O", "O", "O", "O", "O", "O", "O", "]"					  ], 3 => ["[", "O", "O", "O", "O", "O", "O", "O", "]"						], 4 => ["[", "O", "O", "O", "O", "O", "O", "O", "]"						], 5 => ["[", "O", "O", "O", "O", "O", "O", "O", "]"						], 6 => ["[", "O", "O", "O", "O", "O", "O", "O", "]"				    ], 7 => ["-",  1,   2,   3,   4,   5,   6,   7,  "-"				    ]	}

end



#taking turns
def change_turns

	# alternate p1/p2

end



# checking if there's room to drop the piece
def valid_placement?

end

# dropping pieces
def drop_piece

	# place in the desired column

end


# tracking pieces
def pieces_left

	# may not need -- board full can be the determining factor

end

# determining victory
def victory?

	#find if 4 colors are in a row

end
# determining a draw

def draw?

	# are all the pieces placed...or board full?

end
# ending the game




end