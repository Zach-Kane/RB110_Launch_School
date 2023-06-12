require 'pry'

def merge(list1, list2)
  new_list = []
index1 = 0
index2 = 0
  loop do
   #binding.pry
    break if index1 == (list1.size) && index2 == (list2.size)
    if index1 == (list1.size)
      new_list << list2[index2]
      index2 += 1
    elsif index2 == (list2.size)
      new_list << list1[index1]
      index1 += 1
    elsif list1[index1] < list2[index2]
      new_list << list1[index1]
      index1 += 1
    elsif list1[index1] > list2[index2]
      new_list << list2[index2]
      index2 += 1
    end

  end
  new_list
end

p merge([1, 5, 9], [2, 6, 8])# == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]