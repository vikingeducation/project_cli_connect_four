require 'player'
require 'better'
require "dealer"

class Blackjack
  def initialize
    @gambler = Better.new
    @dealer = Dealer.new
  end

  def win?
    @gambler.hand_sum > @dealer.hand_sum
  end

  def payout(bet)
    return bet * 3/2 if blackjack_dealt?
    bet
  end

  def blackjack_dealt?
    @gambler.hand_sum == 21
  end
end
