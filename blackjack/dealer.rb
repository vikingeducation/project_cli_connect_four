require './blackjack.rb'
require './player.rb'
class Dealer < Player
  def initialize(deck)
    @deck=deck
    @player_cards = @deck.deal_cards(1, []) #init dealer with only one card
    @player_stands = false
  end
  def get_move
    if @player_cards.reduce(:+) < 17
      make_move('h') #dealer hits below 17
    else
      make_move('s')
    end
  end

end