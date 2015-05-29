require "./dealer.rb"
require "./player.rb"
require "./hand.rb"
require "./deck.rb"


class Blackjack

  def initialize
    @dealer = Dealer.new
    @player = Player.new(name: "Player", cash: 500)

    @deck = Deck.new


  end


  def play_session
    puts "Welcome!  Let's start playing."
    hand_count = 0
    loop do
      hand_count += 1
      deal_hand
      end_hand

      if bankrupt?
        puts "Looks like you've run out of money!  Thanks for playing!"
        break
      end

      puts "Type 'quit' to stop playing, otherwise we'll play another hand!"

      if gets.chomp == "quit"
        hands = hand_count.to_s + " hand"
        hands << "s" if hand_count > 1

        puts "Thanks for playing!  After #{hands}, you walk away with $#{@player.cash} in your pocket."
        break
      end
    end

  end


  def deal_hand
    @hand = Hand.new(player: @player, dealer: @dealer, deck: @deck)
  end


  def end_hand
    #@hand = nil
  end


  def bankrupt?
    @player.cash <= 0
  end



end


session = Blackjack.new
session.play_session