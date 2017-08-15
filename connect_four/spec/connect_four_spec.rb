require_relative '../connect_four.rb'

describe ConnectFour do
  let (:player1) {Player.new("r", false)}
  let (:player2) {Player.new("y", true)}
  let (:board) {Board.new(5,5,player1,player2)}
  describe 'integration test' do
    it 'finishes sample game with a vertical win' do
      allow(player1).to receive(:get_input).and_return(0)
      allow(player2).to receive(:get_input).and_return(1)
      ConnectFour.play_game(board)
    end

  end
end
