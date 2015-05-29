class Player
  attr_accessor :cash

  def initialize(attrs)
    @name = attrs[:name]
    @cash = attrs[:cash]

  end


  def make_bet
    print "How much do you want to bet?\nCash available: $#{@cash}.\n  $"
    validate_bet
  end


  def validate_bet
    input = nil

    loop do
      input = gets.chomp

      if integer_bet?(input)

        if enough_cash_to_bet?(input)
          puts "You bet $#{input}!\nRemaining cash: $#{@cash - input.to_i}."
          @cash -= input.to_i
          break
        else
          print "You don't have that much cash to bet!\n  $"
        end

      else
        print "Whole dollar bets only, please!\n  $"
      end

    end

    input.to_i
  end


  def integer_bet?(input)
    input.to_i.to_s == input && input.to_i > 0
  end


  def enough_cash_to_bet?(input)
    input.to_i <= @cash
  end


  def player_choice(sum) # sum not used for human player
    input = String.new
    puts "You have #{sum}.\nChoose whether to 'hit' or 'stand':"
    loop do # validation loop
      input = gets.chomp.downcase
      if ["hit", "stand"].include?(input)
        break
      else
        puts "Invalid input. Please enter 'hit' or 'stand':"
      end
    end
    input
  end


  def hit
  # hit
  end


  def stand
  # stand
  end

  #



end