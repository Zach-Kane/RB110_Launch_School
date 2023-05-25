def multiply_all_pairs(arr1, arr2)
  new_arr =  arr1.each_with_object([]) do |num, arr|
    arr2.each do |numb|
      arr << num * numb
    end
  end
  new_arr.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]