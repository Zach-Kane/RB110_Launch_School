# def merge(arr1, arr2)
#   arr2.each do |i|
#     arr1 << i
#   end
#   arr1.uniq
# end

# def merge(arr1, arr2)
#   arr1.union(arr2)
# end

def merge(arr1, arr2)
  arr1 | arr2
end

p merge([1, 3, 5], [3, 6, 9])# == [1, 3, 5, 6, 9]