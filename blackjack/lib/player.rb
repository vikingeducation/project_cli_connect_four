class Player
  DECK = []
  (2..14).each {|num| DECK << [num, 4]}

  def initialize
    @cards = []
  end

  def deal_card
    @cards << get_card_from_deck
    true
  end

  def get_card_from_deck
    card = nil
    loop do
      card = DECK.sample
      break if card[1] > 0
    end
    card[0]
  end

  def hand_sum(hand_arr)
    hand_arr.inject(0) {|total, card| total + card}
  end

  def get_new_card?
     hand_sum(@cards) < 21
  end

  def place_bet
    # ask for bet amount
    bet = gets.strip.
    # validate it is a whole number and will be turned into integer
    bet = bet.to_i if valid_input?
  end

  def valid_input?
    
  end
end
