#computer.rb
class Computer < Player

  def get_column
    1 + rand(7)
  end
end