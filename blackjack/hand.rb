class Hand

  def initialize(hand_attrs)
    @player = hand_attrs[:player]
    @deck = hand_attrs[:deck]

    get_bet

  end


  def get_bet
    @bet = @player.make_bet
    deal_hands
  end


  def deal_hands
    @player_cards = []
    @dealer_cards = []
    # pops one to player, one to dealer, one to player, one hidden to dealer
    2.times do
      @player_cards << @deck.deal_card
      @dealer_cards << @deck.deal_card
    end

    render_hands
  end


  def sum_hand(cards)
    puts cards.inject(0) { |sum, card| sum + @deck.card_values[card] }
  end


  def render_hands
    #show cards
    puts "Player: #{@player_cards.join(" ")}"
    puts "Dealer: #{@dealer_cards.join(" ")}"
    sum_hand(@player_cards)
  end



end