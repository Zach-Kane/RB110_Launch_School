def sequence(num)
  nums = []
  1.upto(num) do |i|
  nums << i
  end
  nums
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]