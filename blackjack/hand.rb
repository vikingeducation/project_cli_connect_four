class Hand

  def initialize(hand_attrs)
    @player = hand_attrs[:player]
    @dealer = hand_attrs[:dealer]
    @deck = hand_attrs[:deck]
    @payout = 2.0
    @winner = nil

    play_loop
  end


  def play_loop
    get_bet
    deal_hands
    blackjack_winner

    player_choices(@player, @player_cards) # loop

    reveal_hidden_card
    render_all

    player_choices(@dealer, @dealer_cards) # dealer hit/stay loop

    # win/loss determination

    # payout
    # end turn
  end


  def get_bet
    @bet = @player.make_bet
  end


  def deal_hands
    @player_cards = []
    @dealer_cards = []

    @player_cards << @deck.deal_card
    @dealer_cards << @deck.deal_card
    @player_cards << @deck.deal_card
    @hidden_card = @deck.deal_card # dealer's hidden card
    @dealer_cards << "?"

    render_all
  end


  def sum_hand(cards)
    #puts cards
    cards.inject(0) { |sum, card| sum + @deck.card_values[card] }
  end


  def render_hand(player, cards)
    total = sum_hand(cards)
    print "#{player.upcase}: #{cards.join(" ")} --> "
    if has_blackjack?(player, cards)
      print "BLACKJACK!!!"
    elsif has_busted?(cards)
      print "BUSTED!!!"
    else
      print "#{total.to_s.rjust(2)}"
    end
    print "\n"
  end


  def render_all
    render_hand("Player", @player_cards)
    render_hand("Dealer", @dealer_cards)
  end


  def has_blackjack?(player, cards)
    total = sum_hand(cards)
    total == 21 && cards.length == 2
  end


  def player_choices(player, cards)

    loop do
      sum = sum_hand(cards)
      input = player.player_choice(sum)

      if input == "hit"
        hit(cards)
      else
        stand
        break
      end

      render_all

      if has_busted?(cards)
        break
      end
    end

  end


  def hit(cards)
    cards << @deck.deal_card
  end


  def stand
    puts "stand"
  end



  def has_busted?(cards)
    sum_hand(cards) > 21
  end


  #def has_21?(player_cards)
  #  sum_hand(cards) == 21
  #end

  def reveal_hidden_card
    @dealer_cards[1] = @hidden_card
  end


  def blackjack_winner
    if has_blackjack?(@dealer, @dealer_cards)
      # everyone loses instantly
    elsif has_blackjack(@player, @player_cards)
      # player wins instantly
    end

  end

end