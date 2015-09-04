class Table
  attr_accessor :players_status

  def initialize
    @players_status = []
  end


  def render_table(current_player, player_hand, dealer_hand)
    sleep(1)
    system 'clear'
    if current_player.is_a?(Dealer) || current_player == nil
      print "Dealer's hand > "
      render_hand(dealer_hand)
    else
      print "Dealer's hand > [###] [#{(dealer_hand[1])}]"
    end
    print "\n"
    print "Player's hand > "
    render_hand(player_hand)
    print "\n"
    puts @players_status
  end

  
  private


    def render_hand(hand)
      hand.each do |card|
        print "[#{card}] "
      end
    end


end