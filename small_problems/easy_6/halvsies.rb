def halvsies(arr1)
  arr2 = []
  arr3 = []
  (arr1.size / 2).times do
    arr2.unshift(arr1.pop)
  end
  arr3.push(arr1, arr2)
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
