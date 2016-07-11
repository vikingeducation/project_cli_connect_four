class Better

  def hand_sum(*num)
    num.inject(0) {|total, card| total + card}
  end
end
