require 'player'
require 'better'
require "dealer"

class Blackjack
  def initialize
    @gambler = Better.new
    @dealer = Dealer.new
  end

  

end
