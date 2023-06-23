# def max_rotation(num)
#   numbers = num.dup.to_s.chars
#   numbers.size.times do |i|
#     numbers << numbers.slice!(i)
#   end
#   numbers.join.to_i
# end

def max_rotation(num)
  num = num.to_s
  num.size.times do |i|
    num << num.slice!(i)
  end
  num.to_i
end

p max_rotation(735291)# == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845