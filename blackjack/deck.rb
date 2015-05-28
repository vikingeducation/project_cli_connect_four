class Deck
  attr_reader :cards, :card_values


  def initialize

    @card_values = Hash.new

    2.upto(10) do |index|
      @card_values[index.to_s.to_sym] = index
    end

    @card_values[:J] = 10
    @card_values[:Q] = 10
    @card_values[:K] = 10
    @card_values[:A] = 11


    @cards = (2..10).to_a
    @cards += ["J", "Q", "K", "A"]
    @cards *= 4
    @cards.shuffle!
  end


  # shuffle

  # re-stack




end