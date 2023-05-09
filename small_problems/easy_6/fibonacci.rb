# def fibonacci(num1, num2, x)
#   x << num1
#   num3 = num1 + num2
#   if num2 < 20**1000
#     fibonacci(num2, num3, x)
#   end
#   x
# end
#  x= []
# FIB = fibonacci(1,1,x)
# puts FIB
# def find_fibonacci_index_by_length(digit)
#   FIB.index {|i| i.to_s.length == digit} + 1
# end

def find_fibonacci_index_by_length(digit)
  n1 = 1
  n2 = 1
  index = 2
  loop do
    index += 1
    n3 = n1 + n2
    n1 = n2
    n2 = n3
    break if n3.to_s.length >= digit
  end
index
end



p find_fibonacci_index_by_length(2) #== 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) #== 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10)# == 45
p find_fibonacci_index_by_length(100) #== 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847