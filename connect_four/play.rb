require_relative './grid'
require_relative './connect_four_presenter'
require_relative './connect_four'


# remove when integration testing finished
require 'pry'

presenter = ConnectFourPresenter.new
grid = Grid.new
game = ConnectFour.new(ui: presenter, grid: grid)

game.play