require 'connect_four'

describe ConnectFour do

  let(:game) {ConnectFour.new}

  it 'is an instance of ConnectFour' do
    expect(subject).to be_a(ConnectFour)
  end

  # Thought I should maybe test out the game_intro method but I see no point.

end
