=begin
  Tests player
  1. init
  Public Methods Human
  1.  get name
  2. get move
  Private Methods Human
  1.  valid_move_input_format
  Tests Human
  1. init
  2. get name
  3. get move
  Pulic Methods Machine
    1. get move
    Private Methods Machine
    1. win_block
  Tests Machine
    1. init
    2. get move
      win
      block
=end
require 'player.rb'
require 'board.rb'

describe "Player Class" do
  player = Player.new(:r)
  describe '#init' do
    it 'should create a new Player' do
    player = Player.new(:r)
    expect(player).to be_a(Player)
    end
  end

  describe 'Human Class' do
    human = Human.new(:r)
    describe '#init' do
      it 'should assign token to player' do
        expect(human.token).to eq(:r)
      end
    end
    describe '#get name' do
      it 'should assign players name from user input' do
        allow(human).to receive(:gets).and_return("Ann")
        expect(human.get_name).to eq("Ann")
      end
    end
    describe '#get move' do
      it 'should get valid move from human' do
        allow(human).to receive(:gets).and_return("1")
        expect(human.get_move(Board.new)).to be_nil
      end
    end
  end #end Human

  describe 'Machine Class' do
    let(:comp) {Machine.new(:y)}
    describe '#init' do
      it 'should create a new instance of Conrad' do
        expect(comp.name).to eq('Conrad')
      end
    end
    describe '#get_move' do
      it 'will make a winning move if possible' do
        comp_win = {1 => [:y, :y, :y, nil, nil, nil],
                              2 => Array.new(6),
                              3 => Array.new(6),
                              4 => Array.new(6),
                              5 => Array.new(6),
                              6 => Array.new(6),
                              7 => Array.new(6)}
        board = Board.new(comp_win)
        comp.get_move(board)
        expect(board.instance_variable_get(:@columns)[1][3]).to eq(:y)
      end
      it 'will make a blocking move if possible' do
        comp_block = {1 => [:r, :r, :r, nil, nil, nil],
                                2 => Array.new(6),
                                3 => Array.new(6),
                                4 => Array.new(6),
                                5 => Array.new(6),
                                6 => Array.new(6),
                                7 => Array.new(6)}
        board = Board.new(comp_block)
        comp.get_move(board)
        expect(board.instance_variable_get(:@columns)[1][3]).to eq(:y)
      end
      it 'will make a blocking move if possible unless winning move possible' do
        comp_win_not_block = {1 => [:r, :r, :r, nil, nil, nil],
                                              2 => [:y, :y, :y, nil, nil, nil],
                                              3 => Array.new(6),
                                              4 => Array.new(6),
                                              5 => Array.new(6),
                                              6 => Array.new(6),
                                              7 => Array.new(6)}
        board = Board.new(comp_win_not_block)
        comp.get_move(board)
        expect(board.instance_variable_get(:@columns)[2][3]).to eq(:y)
      end

    end
  end #end Machine
end #end Player
