# def buy_fruit(list)
#   fruits = []
#   list.each do |fruit|
#     fruit[1].times do
#       fruits << fruit[0]
#     end
#   end
#   fruits
# end

def buy_fruit(list)
  list.map! do |fruit|
    [fruit[0]] * fruit[1]
  end
  list.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]