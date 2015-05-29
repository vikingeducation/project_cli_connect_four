require "./dealer.rb"
require "./player.rb"
require "./hand.rb"
require "./deck.rb"


class Blackjack

  def initialize
    @dealer = Dealer.new(name: "Dealer")
    @player = Player.new(name: "Player", cash: 500)

    @deck = Deck.new
  end


  def play_session
    system("clear")
    puts "Welcome!  Let's start playing."
    hand_count = 0
    loop do
      hand_count += 1
      reshuffle_deck
      deal_hand

      if bankrupt?
        puts "Looks like you've run out of money!  Thanks for playing!"
        break
      end

      puts "Type 'quit' to stop playing, otherwise we'll play another hand!"

      if gets.chomp == "quit"
        hands = hand_count.to_s + " hand"
        hands << "s" if hand_count > 1

        puts "\nThanks for playing!  After #{hands}, you walk away with $#{@player.cash} in your pocket."
        break
      else
        system("clear")
      end
    end

  end


  def deal_hand
    @hand = Hand.new(player: @player, dealer: @dealer, deck: @deck)
  end


  def bankrupt?
    @player.cash <= 0
  end


  def reshuffle_deck
    if @deck.cards.length < 52
      puts "Reshuffling..."
      @deck = Deck.new
    end
  end

end


session = Blackjack.new
session.play_session