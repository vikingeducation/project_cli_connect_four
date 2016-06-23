require_relative  'connect_four'
require_relative  'board'
require_relative  'player'
require_relative  'stack'
require_relative  'disk'

# Includes the ConnectFour
# module into the global
# namespace

# Play!
game = Game.new
game.play
