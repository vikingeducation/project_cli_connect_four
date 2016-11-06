#!/usr/bin/ruby

require_relative 'board'
require_relative 'connect_four_controller'
require_relative 'connect_four'
require_relative 'game_view'
require_relative 'player'
require_relative 'board_view'

ConnectFourController.new.play
