class Deck
  attr_reader :cards, :card_values


  def initialize

    @card_values = Hash.new

    2.upto(10) do |index|
      @card_values[index.to_s] = index
    end

    @card_values["J"] = 10
    @card_values["Q"] = 10
    @card_values["K"] = 10
    @card_values["A"] = 11
    @card_values["?"] = 0 # for hidden dealer card


    @cards = (2..10).to_a.map { |card| card.to_s }
    @cards += ["J", "Q", "K", "A"]
    @cards *= 4
    @cards.shuffle!

    #@cards = ["K","5","A","5","K"] #for testing
  end


  def deal_card
    @cards.pop
  end


#  def get_card_value(card)
#    @card_values[card]
#  end
  # shuffle

  # re-stack




end