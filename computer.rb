module ConnectFour

  class Computer < Player
    def initialize(name, marker)
      super
    end

    def choose_column
      # randomly choose a column for now..
      (1..7).to_a.sample
    end
  end

end