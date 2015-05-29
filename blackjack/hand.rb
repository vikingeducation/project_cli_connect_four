class Hand

  def initialize(hand_attrs)
    @player = hand_attrs[:player]
    @dealer = hand_attrs[:dealer]
    @deck = hand_attrs[:deck]
    @payout_factor = 2.0
    @winner = nil

    deal_and_check
  end


  def deal_and_check
    get_bet
    deal_hands
    blackjack_winner
    check_winner_else_do("player_loop")
  end


  def player_loop
    player_choices(@player, @player_cards) # loop
    check_winner_else_do("dealer_loop")
  end


  def dealer_loop
    reveal_hidden_card
    render_all

    player_choices(@dealer, @dealer_cards) # dealer hit/stay loop
    check_winner_else_do("compare_hands")
  end


  def compare_hands
    # win/loss determination
    case sum_hand(@player_cards) <=> sum_hand(@dealer_cards) #need exclusion for busted players
    when -1
      puts "Dealer wins!"
      @winner = @dealer
      player_lose
    when 1
      puts "You win!"
      @winner = @player
      player_win
    else
      push
    end
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
    total += @deck.card_values[@hidden_card] if player == @dealer
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
        if player == @player
          @winner = @dealer
        else
          @winner = @player
        end
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


  def reveal_hidden_card
    @dealer_cards[1] = @hidden_card
  end


  def blackjack_winner
    if has_blackjack?(@dealer, @dealer_cards)
      @winner = @dealer
    elsif has_blackjack?(@player, @player_cards)
      @payout_factor += 0.5
      @winner = @player
    end
  end


  def check_winner_else_do(next_method)
    if @winner == @dealer
      player_lose
    elsif @winner == @player
      player_win
    else
      send(next_method)
    end
  end


  def player_lose
    puts "from player_lose!"  #runs 4 times every time???
  end


  def player_win
    puts "from player_win!"
    payout
  end


  def push
    @payout_factor = 1.0
    puts "Push!"
    payout
  end


  def payout
    @player.cash += (@bet * @payout_factor).to_i # we round down in this casino...
  end

end