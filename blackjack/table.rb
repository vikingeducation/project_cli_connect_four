class Table
  attr_accessor :player_hand, :dealer_hand, :current_hand

  def initialize(player_hand, dealer_hand)
    @player_hand = player_hand
    @dealer_hand = dealer_hand
  end


  def render_table(current_player)
    sleep(1)
    system 'clear'
    if current_player.is_a?(Dealer)
      print "Dealer's hand > "
      render_hand(@dealer_hand)
    else
      print "Dealer's hand > [###] [#{(@dealer_hand[1])}]"
    end
    print "\n"
    print "Player's hand > "
    render_hand(@player_hand)
    print "\n"
  end


  def render_hand(hand)
    hand.each do |card|
      print "[#{card}] "
    end
  end


  def busted?
    if total_hand > 21
      return true
    end
  end


  def blackjack?
    if total_hand == 21
      return true
    end
  end


  def aces_in_hand?
    if @current_hand.any? { |card| card[0] == "A" }
      return true
    end
  end


  def total_hand
    if aces_in_hand?
      total_hand_with_aces
    else
      total_hand_without_aces
    end
  end


  def total_hand_without_aces
    values = []
    @current_hand.map do |card|
      next if card[0] == "A"
      value = card.gsub(/[JQK]/, '10')
      value.slice!(-2..-1)
      values << value.to_i
      end
    values.reduce(:+)
  end


  def total_hand_with_aces
    aces = Array.new(@current_hand.select { |card| card[0] == "A" })
    value = total_hand_without_aces
    num_of_aces = aces.length
    if value + 11 + (num_of_aces - 1) > 21
      value + num_of_aces
    else
      value + 11 + (num_of_aces - 1)
    end
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
    if player_hand_value == dealer_hand_value
      return true
    end
  end

end