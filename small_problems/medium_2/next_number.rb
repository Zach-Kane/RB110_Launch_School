def featured(number)
  sevens = [*1..1000000].map do |num|
    num * 7
  end
  seven = 0
  sevens.select! { |num| num > number && num.odd? }
  loop do
    seven = sevens.shift
    count = []
    seven.to_s.chars.each do |ea|
      count << seven.to_s.count(ea)
    end
    break if count.all? { |num| num < 2 }
  end
  seven
end

# def featured(number)

# end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987

# featured(9_999_999_999) # -> There is no possible number that fulfills those requirements