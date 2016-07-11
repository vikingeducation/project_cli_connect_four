class Player
  attr_writer :cards

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
      if card[1] > 0
        card[1] -= 1
        break
      end
    end
    card[0]
  end

  def hand_sum
    @cards.inject(0) {|total, card| total + card}
  end

  def get_new_card?
     hand_sum < 21
  end

  def place_bet
    # validate it is a whole number and will be turned into integer
    bet = get_player_input until valid_input?(bet)
    bet
  end

  def valid_input?(bet)
    (bet.is_a? Integer) && (bet > 0)
  end

  def get_player_input
    gets.strip.to_i
  end
end
