def fibonacci(number)
  num1 = 0
  num2 = 1
  num3 = nil
  (number -1).times do
    num3 = num1 + num2
    num1 = num2
    num2 = num3
    puts num3
  end
num3
end

def fibonacci_last(number)
   fibonacci(number)#.to_s.slice(-1).to_i
end

# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
#p fibonacci_last(123456789) # -> 4