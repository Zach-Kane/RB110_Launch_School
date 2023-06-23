# def rotate_rightmost_digits(num, digit)
#   numbers = num.dup.to_s.chars
#   numbers << numbers.slice!(-digit)
#   numbers.join.to_i
# end

def rotate_rightmost_digits(num, digit)
  num = num.to_s
  num << num.slice!(-digit)
  num.to_i
end

p rotate_rightmost_digits(735291, 1) #== 735291
p rotate_rightmost_digits(735291, 2)# == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917