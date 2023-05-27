# def sum(integer)
#   digits = integer.to_s.size - 1
#   start = 10**(digits)
#   total = []
#   digits.times do
#     div = integer.divmod(start)
#     total << div[0]
#     integer = div[1]
#     start /= 10
#     total << div[1] if start == 1
#   end
#   total
# end

def sum(number)
  numbers = number.to_s.chars
  total = 0
  numbers.each {|num| total += num.to_i}
  total
end



p sum(23) #== 5
p sum(496) #== 19
p sum(123_456_789)# == 45