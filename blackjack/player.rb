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
          puts "You don't have that much cash to bet!"
        end

      else
        puts "Whole dollar bets only, please!"
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

  # hit

  # stay

  #



end