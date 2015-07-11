module Helper


  def total_hand(hand)
    aces_in_hand?(hand) ? total_hand_with_aces(hand) : total_hand_without_aces(hand)
  end


  def aces_in_hand?(hand)
    if hand.any? { |card| card[0] == "A" }
      return true
    end
  end


  def total_hand_without_aces(hand)
    values = []

    hand.map do |card|
      next if card[0] == "A"
      value = card.gsub(/[JQK]/, '10')
      value.slice!(-2..-1)
      values << value.to_i
    end
    
    values.reduce(:+)
  end


  def total_hand_with_aces(hand)
    aces = Array.new(hand.select { |card| card[0] == "A" })
    value = total_hand_without_aces(hand)
    num_of_aces = aces.length
    if value + 11 + (num_of_aces - 1) > 21
      value + num_of_aces
    else
      value + 11 + (num_of_aces - 1)
    end
  end


  def hand_busted?(hand)
    if total_hand(hand) > 21
      return true
    end
  end


  def blackjack_in_hand?(hand)
    total_hand(hand) == 21
  end


  def winner?(player_hand_value, dealer_hand_value)
    unless draw?(player_hand_value, dealer_hand_value)
      determine_best_hand(player_hand_value, dealer_hand_value)
    end
  end


  def determine_best_hand(player_hand_value, dealer_hand_value)
    hands = { :Player => player_hand_value, 
              :Dealer => dealer_hand_value }

    hands.keep_if do |key,val| 
      val <= 21
    end
    
    return hands.max_by { |key,val| val }[0]
  end


  def draw?(player_hand_value, dealer_hand_value)
    player_hand_value == dealer_hand_value
  end


end