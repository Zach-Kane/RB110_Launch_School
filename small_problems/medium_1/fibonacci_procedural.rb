def fibonacci(number)
  num1 = 0
  num2 = 1
  num3 = nil
  (number -1).times do
    num3 = num1 + num2
    num1 = num2
    num2 = num3
  end
num3
end


p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501