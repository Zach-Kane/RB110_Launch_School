def diamonds(num)
index = 1
  1.upto(num/2) do |i|
    puts"#{" " * ((num / 2) - (i-1)) }#{'*' * index}"
  index += 2    
end
puts "*" * index
index -= 2
  1.upto(num/2) do |i|
    puts"#{" " * i }#{'*' * index}"
  index -= 2    
end
end 

diamonds(50)