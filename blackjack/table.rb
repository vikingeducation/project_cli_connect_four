class Table
  attr_accessor :player_hand, :dealer_hand, :current_hand

  def initialize(player_hand, dealer_hand)
    @player_hand = player_hand
    @dealer_hand = dealer_hand
    @current_hand = @player_hand
  end

  def render_table
    system 'clear'
    if @current_hand != @dealer_hand
    print "Dealer's hand > [#][#{@dealer_hand[0]}"
    else
    print "Dealer's hand > #{render_hand(@dealer_hand)}"
    end
    print "\n"
    print "Player's hand > #{render_hand(@player_hand)}"
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
      value = card.gsub(/[JQK]/, '10')
      value.slice!(-2..-1)
      values << value.to_i
      end
    values.reduce(:+)
  end

  def total_hand_with_aces
    aces = Array.new(@current_hand.select { |card| card[0] == "A" })
    @current_hand -= aces
    value = total_hand_without_aces
    num_of_aces = aces.length
    if value + 11 + (num_of_aces - 1) > 21
      value + num_of_aces
    else
      value + 11 + (num_of_aces - 1)
    end
  end


end