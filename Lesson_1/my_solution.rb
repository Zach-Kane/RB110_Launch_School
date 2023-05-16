def sum_even_number_row(num)
  this_array = []
  (1..num).each do |row|
    current_number = 2
    row.times do
      this_array << current_number
      current_number += 2
    end
  end
  this_array.sum
end

p sum_even_number_row(1) #== 2
p sum_even_number_row(2) #== 10
p sum_even_number_row(4) #== 68

# Input integer will set how many times a method executes.
# Starting with row 1
# will create first row `[2]` then increment to `[4, 6]`.
# Input equals total number of rows. 
# Add to array
# Next row will start from next integer of last array.