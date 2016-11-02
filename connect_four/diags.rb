# def diagonal_combos(position)
#   diag_combos = []
#   # v = 1
#   (1..3).each do |vec|
#     vector = [vec, vec]
#     combo = add(position, vector)
#     diag_combos.push(combo)
#   end
#   diag_combos
# end
# def add(position, set)
#   new_pos = []
#   set.each do |x_axis|
#     multiplier = 1
#     i.each do |y_axis|
#       new_pos.push[(position[0] + i * multiplier, position[1] + n * multiplier)]
# end
[(-3..0), (-2..1), (-1..2), (0..3)].each do |r|
  
def diagonal_combos(position)
  d_combos = []
  increments = [[1,1],[-1,-1],[-1,1],[1,-1]]
  increments.each do |set|
    temp_diag = [position]
    (1..3).each do |multiplier|
      temp_diag.push(add(position, set, multiplier))
    end
    d_combos.push(temp_diag)
  end
  d_combos
end


def add(position, set, multiplier = 1)
  [position[0] + (set[0] * multiplier), position[1] + (set[1] * multiplier)]
end

x = diagonal_combos([0,0])
p x
x.length

