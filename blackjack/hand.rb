class Hand

  def initialize(hand_attrs)
    @player = hand_attrs[:player]
    @deck = hand_attrs[:deck]

    get_bet
  end


  def get_bet
    @bet = @player.make_bet
  end


end