require './connect_four.rb'
require './board.rb'
require './win_judge.rb'
require './player.rb'
require './human_player.rb'
require './bot_player.rb'
require './bot_board.rb'
require 'pry-byebug'

game = ConnectFour.new
game.board.layout = [ ["O", "_", "_", "_", "_", "_"],
                      ["_", "_", "_", "_", "_", "_"],
                      ["_", "_", "_", "_", "_", "_"],
                      ["X", "X", "X", "_", "_", "_"],
                      ["_", "_", "_", "_", "_", "_"],
                      ["_", "_", "_", "_", "_", "_"],
                      ["_", "_", "_", "_", "_", "_"] ]

game.play