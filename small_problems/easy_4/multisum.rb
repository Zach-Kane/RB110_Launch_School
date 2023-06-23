def multisum(num)
  sums = []
  fives = 5
  threes = 3
  until threes > num
    sums << threes
    threes += 3
  end
  until fives > num
    sums << fives
    fives += 5
  end
  sums.uniq.sum
end


p multisum(3) #== 3
p multisum(5) == 8
p multisum(10)# == 33
p multisum(1000)# == 234168