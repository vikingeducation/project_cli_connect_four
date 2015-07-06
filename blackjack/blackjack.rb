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
    @player_1 = Human.new
    @dealer = Dealer.new
    @current_player = @player_1
    @table.current_hand = @table.player_hand
  end

  def play
    input = nil
    @table.render_table(@current_player)
    loop do
      advance_game(input)
      input = @current_player.hit_or_stand(@table)
    end
  end

  def determine_winner
    if nil
    end
  end

  def advance_game(input)
    if hand_end?(input)
      if @current_player == @player_1
        @current_player = @dealer
        @table.current_hand = @table.dealer_hand
      elsif @current_player == @dealer
        exit
      end
    elsif input == "h"
      player_hit
    end
  end

  def player_hit
    @table.current_hand << @deck.card
    @table.render_table(@current_player)
    puts "#{@current_player} Hits!"
  end

  def hand_end?(input)
    blackjack? || busted? || stand?(input) || quit?(input)
  end

  def blackjack?
    if @table.blackjack?
      @current_player.hand_value = :blackjack
      @table.render_table(@current_player)
      puts "#{@current_player} blackjack!"
      return true
    end
  end

  def busted?
    if @table.busted?
      @current_player.hand_value = :busted
      @table.render_table(@current_player)
      puts "#{@current_player} busts at #{@table.total_hand}!"
      return true
    end
  end

  def stand?(input)
    if input == "s"
      @current_player.hand_value = @table.total_hand
      @table.render_table(@current_player)
      puts "#{@current_player} stands at #{@table.total_hand}."
      return true
    end
  end

  def quit?(input)
    if input == "q"
      @table.render_table(@current_player)
      puts "#{@current_player} has quit!"
      exit
    end
  end
end

game = Blackjack.new
game.play