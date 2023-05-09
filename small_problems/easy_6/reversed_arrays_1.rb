def reverse!(list)
  front = 0
  back = -1
  ((list.size) /2).times do
    list[front], list[back] = list[back], list[front]
    front += 1
    back -= 1
  end
  list
end


p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list  == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == []  #true