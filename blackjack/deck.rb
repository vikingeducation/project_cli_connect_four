require './blackjack.rb'
class Deck
  def initialize
   @deck=create_deck
  end

  def create_deck
    deck= {
      hearts: [],
      diamonds: [],
      spades: [],
      clubs: []
    }
    (2..9).each do |card|
      deck[:hearts] << card
      deck[:diamonds] << card
      deck[:spades] << card
      deck[:clubs] << card
    end
    4.times do #push in the value-10 cards
      deck[:hearts] << 10
      deck[:diamonds] << 10
      deck[:spades] << 10
      deck[:clubs] << 10
    end

    #push in the aces
    deck[:hearts] << 11
    deck[:diamonds] << 11
    deck[:spades] << 11
    deck[:clubs] << 11

    deck
  end

  def deal_cards(cards=1, player_cards)
    cards.times do |card|
      rand_suit = rand(4)
      rand_card = rand(@deck.to_a[rand_suit][1].length)
      player_cards << @deck.to_a[rand_suit][1][rand_card]
      update_deck(rand_suit,rand_card) #+2 needed to get the actual card, not the index
    end
    player_cards
  end

  def update_deck(suit,card) #remove the cards from the deck as they're dealt to the player
    case suit
      when 0
        @deck[:hearts].delete_at(card)
      when 1
        @deck[:diamonds].delete_at(card)
      when 2
        @deck[:spades].delete_at(card)
      when 3 
        @deck[:clubs].delete_at(card)
    end
  end
  def render(player, dealer)
    puts "\n################################"
    puts "Player cards are #{player}"
    puts "Dealer cards are #{dealer}"
    puts "################################\n\n"
  end

end