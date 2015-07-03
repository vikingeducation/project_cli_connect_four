class DeckOfCards

  def initialize
    make    
  end

  def make
    # This was more fun than manually typing an array with all 52 playing cards
    # in it.
    @deck = []
    suits = ["_C", "_H", "_D", "_S"]
    values = (("2".."10").to_a) + ["J", "Q", "K", "A"]
    suits.each do |suit|
      values.each do |value|
        @deck << value + suit
      end
    end   
  end

  def shuffle
    @deck.shuffle!
  end

  def card
    @deck.pop    
  end
  
end

class Blackjack
  attr_reader :player_hand, :dealer_hand

  def initialize
    deck = DeckOfCards.new
    deck.shuffle
    @player_hand = [deck.card, deck.card]
    @dealer_hand = [deck.card, deck.card]
  end
  
  def total_hand(hand)
    hand.map! do |card|
      card.gsub!(/[JQK]/, '10')
      card.slice!(-2..-1)
      card.to_i
      end
    hand.reduce(:+)
  end
  
end

def total_hand(hand)
  values = []
  hand.map do |card|
    # The "cards" are designed to be manipulated somewhat easily so we can
    # Calculate the value of the hand.  Here we convert face cards to 10
    value = card.gsub(/[JQK]/, '10')
    # And then slice off the last two characters of text
    value = card.slice(-2..-1)
    # Finally we have an array consisting of just the values of the cards
    values << value.to_i
    end
  values.reduce(:+)
end

def total_hand_with_aces(hand)
  # Here we decide how to deal with Aces in the hand, and determine the value
  # of the hand based on that decision.
  aces = Array.new(hand.select { |card| card[0] == "A" })
  hand -= aces
  # We've selected the aces out of the hand array then sent the remaining hand
  # to be calculated
  value = total_hand(hand)
  num_of_aces = aces.length
  # Now we decide if one of our aces is going to equal 11 or not.  Handles the 
  # edge case of several aces in hand.  The final return from this method is the 
  # value of the hand with the most advantageous values for the aces.
  if value + 11 + (num_of_aces - 1) > 21
    value + num_of_aces
  else
    value + 11 + (num_of_aces - 1)
  end
end