#human.rb
class Human < Player

  def get_column
    begin
      print "#{name} Please enter a column 1-7: "
      column_num = gets.chomp      
    end until input_valid?(column_num)
    column_num.to_i
  end

  private

    def input_valid?(input)
      (1..7) === input.to_i
    end

end

