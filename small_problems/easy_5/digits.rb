def digit_list(integer)
  digits = []
  until integer == 0
    integer, remainder = integer.divmod(10)
    digits.unshift(remainder)
  end
  digits
end

  


p digit_list(12345) == [1, 2, 3, 4, 5]     # => true
p digit_list(7) == [7]                     # => true
p digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
p digit_list(444) == [4, 4, 4]             # => true


# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

# P: Input => positive integer
# Ouput => list of the digits in the number.
# E: Digits in number in an array
# each digit.
# D: Breakdown by place.
# loop by size? 