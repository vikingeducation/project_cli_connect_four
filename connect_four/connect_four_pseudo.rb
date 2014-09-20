classes
GAME
PLAYER
BOARD
AI


set up the game initially [GAME]
	create a game board [BOARD]
	create players [PLAYER]
		IF 1 player, create AI [AI]

start game loop [GAME]
	render the board [BOARD]
	ask for and validate current players move [PLAYER]
	IF the game should end [GAME]
		display the proper victory / draw message
		stop loop
	ELSE
		swtich to the next player and keep looping [GAME]



		GAME
		# initialize
			# set up board
			# set up players OR AI
			# assign the starting player

		# play
			# loop infinitely
			# call render method
			# ask for move from current player
			# break loop if game is over
			# switch players

		# check_game_over
			# check_victory
			# check_draw

		# check_victory
			# IF board says current player's piece has a winning_combo?
				# display a victory message

		# check_draw
			# IF Board says board_full?
				# display draw message

		# switch_players
			# Red player now Yellow player or vice versa

			PLAYER
			# initialize
				# Set marker type (red or yellow)

			# get_move
				# loop infinitely
					# ask_for_move
					# IF validate_move_format is true
							# break loop

			# ask_for_move
				# display message to ask for move
				# get move from command line

			# validate_move_format
				# UNLESS move is in the proper format
					# display error message

			BOARD
				# initialize board
					# set up blank data structure

				# render
					# loop through data structure
						# display an existing marker if any, else blank

				# add_piece
					# IF piece_location_valid? && row_not_full
						# place piece
					# ELSE
						# display error message

				# piece_location_valid?
					# is the placement within_valid_location?
					# is the row_full?

				# within_valid_location?
					# UNLESS piece coords are in the accceptable range
						# display error message

				# row_full?
					# IF row is full
						# display error message

				# winning_combination?
					# is there a winning_diagonal?
					# or winning_vertical?
					# or winning_horizontal?

				# winning_diagnoal?
					# check if specified piece makes 4 pieces diagonal

				# winning_vertical?
					# check if specified piece makes 4 pieces vertical

				# winning_horizontal?
					# check if specified piece makes 4 pieces horizontal

				# diagnoals
					# return the diagonal pieces

				# verticals
					# return the vertical pieces

				# horizontals
					# return the horizontal pieces

				# full?
					# does every square contain a piece?

				AI 
				# inherit from board to track board state and make
				# smart moves based on piece location





















