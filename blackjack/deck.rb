class DeckOfCards

  def initialize
    make
    @deck.shuffle!    
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


  def card
    @deck.pop    
  end
  
end