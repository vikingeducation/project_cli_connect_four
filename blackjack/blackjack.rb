require 'pry'
load 'player.rb'
load 'table.rb'

class DeckOfCards

  def initialize
    make    
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

  def shuffle
    @deck.shuffle!
  end

  def card
    @deck.pop    
  end
  
end

class Blackjack
  attr_reader :player_1, :dealer, :table

  def initialize
    @deck = DeckOfCards.new
    @deck.shuffle
    @table = Table.new([@deck.card, @deck.card],[@deck.card, @deck.card])
    @player_1 = Player.new
    @dealer = Player.new
    @current_player = @player_1
  end

  def play
    loop do 
      @table.render_table
      @table.current_hand = @table.player_hand
      input = @current_player.hit_or_stand
      break if player_ends_hand?(input)
      break if hand_end?
      player_hit if input =="h"
    end
    loop do
      puts "In Dealer Loop"
      puts "Quitting..."
      exit
    end
  end

  def player_hit
    @table.current_hand << @deck.card
    puts "#{@current_player} Hits!"
  end

  def hand_end?
    blackjack? || busted?
  end

  def blackjack?
    if @table.current_hand.blackjack?
      puts "#{@current_player} blackjack!"
      return true
    end
  end

  def busted?
    if @table.current_hand.busted?
      puts "#{@current_player} busted!"
      return true
    end
  end

  def player_ends_hand?(input)
    stand?(input) || quit?(input)
  end

  def stand?(input)
    if input == "s"
      puts "#{@current_player} stands."
      return true
    end
  end

  def quit?(input)
    if input == "q"
      puts "#{@current_player} has quit!"
      exit
    end
  end




end