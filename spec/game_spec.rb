require 'game'


=begin

  initialize
  - a new game is has a class of game
  - a new game creates a new board
  - a new game creates player1
  - a new game creates player2
  - a new game creates a current player

  switch player
  - if current player is player1, make current player player 2
  - if current player is player2, make current player player1


=end

describe Game do

  before do
    allow_any_instance_of(Game).to receive :print_instructions
    allow(Player).to receive(:create_player).and_return("h")
    allow_any_instance_of(Player).to receive :puts
  end

  let(:g){Game.new}

  describe '#initialize' do

    it 'is a new game and has the class Game' do
      expect(g).to be_a Game
    end

    it 'creates a board' do
      expect(g.instance_variable_get( :@board)).to be_a Board
    end

  end












end