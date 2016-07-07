# Your code here!
# Classes: Player, Human, Computer, Game, Board, Column
# Board: 7 across, 6 up

# Board should be an array of arrays of Columns

# Player: initialize, get_move
# Human: valid_move? prompt
# Computer: print_choice
# Game: Initialize, play, win?, full?
# Board: render, add_piece(location)
# Column: initialize, show


$LOAD_PATH << __dir__

require 'pry'
require 'column'
require 'board'
require 'game'
require 'player'
require 'human'
require 'computer'

module ConnectFour

game=ConnectFour::Game.new(7,6)
game.play

end