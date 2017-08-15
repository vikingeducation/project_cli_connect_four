require_relative '../lib/board.rb'
require_relative '../lib/player.rb'


describe Board do
  let (:board) {Board.new}
  describe 'initialize' do
    it 'has default width and height of the board' do
      expect(board.instance_variable_get(:@height)).to eq(5)
      expect(board.width).to eq(5)
    end
    it 'defaults to two players with different colors' do
      color1 = board.instance_variable_get(:@player1).color
      color2 = board.instance_variable_get(:@player2).color
      expect(color1).to_not eq(color2)
    end
  end

  describe 'drop_piece' do
    it 'changes board array to current players color' do
      current_color = board.current_player.color
      board.drop_piece(3)
      expect(board.instance_variable_get(:@board)[4][3]).to eq(current_color)
    end
  end

  describe 'switch_player' do
    it 'changes current_player' do
      original_player = board.current_player
      board.switch_player
      expect(board.current_player).to_not eq(original_player)
    end
  end

  describe 'determine_if_finished' do
    it 'catches horizontal victories' do
      board.instance_variable_set(:@board,[['r', 'r', 'r', 'r']])
      board.instance_variable_set(:@current_player, Player.new('r', false))
      board.send(:determine_if_finished, 0, 0)
      expect(board.instance_variable_get(:@finished)).to eq(true)
    end
    it 'catches vertical victories' do
      board.instance_variable_set(:@board,[['r'],['r'],['r'],['r']])
      board.instance_variable_set(:@current_player, Player.new('r', false))
      board.send(:determine_if_finished, 0, 0)
      expect(board.instance_variable_get(:@finished)).to eq(true)
    end
    it 'catches down-right victories' do
      board.instance_variable_set(:@board,[['r','0','0','0'],['0','r','0','0'],['0','0','r','0'],['0','0','0','r']])
      board.instance_variable_set(:@current_player, Player.new('r', false))
      board.send(:determine_if_finished, 0, 0)
      expect(board.instance_variable_get(:@finished)).to eq(true)
    end
    it 'catches down-left victories' do
      board.instance_variable_set(:@board,[['0','0','0','r'],['0','0','r','0'],['0','r','0','0'],['r','0','0','0']])
      board.instance_variable_set(:@current_player, Player.new('r', false))
      board.send(:determine_if_finished, 0, 3)
      expect(board.instance_variable_get(:@finished)).to eq(true)
    end
    it 'catches up-right victories' do
      board.instance_variable_set(:@board,[['0','0','0','r'],['0','0','r','0'],['0','r','0','0'],['r','0','0','0']])
      board.instance_variable_set(:@current_player, Player.new('r', false))
      board.send(:determine_if_finished, 0, 3)
      expect(board.instance_variable_get(:@finished)).to eq(true)
    end
    it 'catches up-left victories' do
      board.instance_variable_set(:@board,[['r','0','0','0'],['0','r','0','0'],['0','0','r','0'],['0','0','0','r']])
      board.instance_variable_set(:@current_player, Player.new('r', false))
      board.send(:determine_if_finished, 0, 0)
      expect(board.instance_variable_get(:@finished)).to eq(true)
    end
  end
end
