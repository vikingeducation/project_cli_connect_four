load 'player.rb'
load 'table.rb'
load 'deck.rb'

class Blackjack
  attr_reader :player_1, :dealer, :table

  def initialize
    @deck = DeckOfCards.new
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
      break if advance_game(input) == :dealer_finished
      input = @current_player.hit_or_stand(@table)
      @current_player.hand_value = @table.total_hand
    end

    determine_winner
  end


  def determine_winner
    winner = @table.winner?(@player_1.hand_value, @dealer.hand_value)
    if winner == nil
      puts "Its a draw!"
      exit
    else 
      puts "#{winner} wins!"
    end
  end


  def advance_game(input)
    if hand_end?(input)
      if @current_player == @player_1
        @current_player = @dealer
        @table.current_hand = @table.dealer_hand
      elsif @current_player == @dealer
        return :dealer_finished
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
      @table.render_table(@current_player)
      puts "#{@current_player} blackjack!"
      return true
    end
  end


  def busted?
    if @table.busted?
      @table.render_table(@current_player)
      puts "#{@current_player} busts at #{@table.total_hand}!"
      return true
    end
  end


  def stand?(input)
    if input == "s"
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