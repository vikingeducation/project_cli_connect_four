module ConnectFour

  class Player
    attr_reader :name,
                :marker

    def initialize(name, marker)
      @name = name
      @marker = marker
    end

    # asks player which column to place his marker in
    def ask_for_column
      print "Please enter the column you want to place your marker in: "

      column = gets.chomp.to_i
      until (1..7).include?(column)
        print "That is an invalid column. Please enter a number from 1 to 7: "
        column = gets.chomp.to_i
      end

      column
    end
  end
end