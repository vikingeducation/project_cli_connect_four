require './connect_four/game'
require './connect_four/board'
require './connect_four/player'
require './connect_four/computer'
require './connect_four/human'


# Includes the 
# module into the global
# namespace
include Connect_Four

# Play!
Game.new.play