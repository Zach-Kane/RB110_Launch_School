# def bubble_sort!(array)
#   (array.size - 1).times do |i|
#     sort = [array[i], array[i+1]]
#     if sort != sort.sort
#       array[i], array[i + 1] = array[i + 1], array[i]
#     end
#   end
#   array
# end

# Solved! 

def bubble_sort!(array)
  loop do
    compare = array.dup
    (array.size - 1).times do |i|
      if array[i] > array[i + 1] 
        array[i], array[i + 1] = array[i + 1], array[i]
      end
    end
    break if compare == array
  end
  array
end

 array = [5, 3]
 bubble_sort!(array)
 p array == [3, 5]

 array = [6, 2, 7, 1, 4]
  bubble_sort!(array)
 p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)