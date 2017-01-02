require './game'
require './board'
require './player'
require './computer'
# require './connect_four/human'


# Includes the 
# module into the global
# namespace
include Connect_Four

# Play!
Game.new.play