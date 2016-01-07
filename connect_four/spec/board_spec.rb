require 'board'


describe Board do
  let(:a) {Board.new}
  let(:d) {Disk.make_player_1_disk}

  describe 'initialize' do
    it 'sets instance variable @board to empty_board' do
      expect(a.board).to eq(a.empty_board)
    end 
  end
  

  describe 'place_disk' do
    it'places disk on left column' do
      test_board = a.board
      a.place_disk(d,0)
      expect(test_board[0][0]).to eq(d)
    end
  end



  # describle 'valid_move?' do
  #   it 'returns false if column is full' do
  #     test_board = a.board
  #     (0..5).each do |row|
  #        text_board[row][0] = d
  #     end
  #     expect(d.valid_move)

  #   end
  # end


end