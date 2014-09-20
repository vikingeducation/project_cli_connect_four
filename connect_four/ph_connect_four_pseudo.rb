##---------------
# Classes:

Game:
	@whos_turn

	Init board
	@whos_turn = rand(1..2) # flip a coin to see who's first
	Init player(s)
		prompt player(whos_turn)
		 for toke_color
	

	I/O controller - comms to/from Players to/from Game
		prompt_player_for_play
		get play
			check board.valid_add?
				no? then get play (again)
				yes? then board.add_piece
	
	Win_Evaluator - uses rules to determine a winner
	- row & col should be easy checks
	- diags are going to be the challenge here
	-- look at array testing schemes...

Board:
	# -> The board doesn't care about the 'rules' of the game.
	# -> i.e., a board can be full of all red checkers (token) 
	# -> as far as the board cares. For this reason the Game 
	# -> will evaluate the board for a Player win
	- size
	- render() # on screen
	- report_state
	-- returns the 2D array 'playfield'
	- Add piece(toke_color,row)
	-- valid_add?()
	--- column valid? && !full?
	-- Add to row and report which column it 'landed' on



Player:
	@player_num # factory set
	set token (checker) toke_color
	make_move() #
	is_winner?

AI:
	review Board state to determine next valid move
	- random?
	- put thought into it?
	-- could be time consuming..

##---------------
# Program flow

Init Game (Game)
	Init board
		2-D array x=7 y=6 
		Playfield = [7][6]
	Init Player(s)
		if 1 Player
			setup P2 as an AI
		# PlayerFactory?

	Game Loop (Game)


