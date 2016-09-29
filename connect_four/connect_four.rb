require './game.rb'
require './player.rb'
require './board.rb'

game = Game.new

game.play until game.over

#TO ADD: welcome imagery, play again functionality, quit option, and one-player option (with smart AI opponent)