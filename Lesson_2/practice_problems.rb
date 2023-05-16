puts "Problem # 7"

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

p arr
p a
p b


puts "Problem # 8"

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = %W(A E I O U a e i o u)

hsh.each do |key, value|
  value.each do |word|
    word.chars.each do |letter|
      puts letter if VOWELS.any?(letter)
    end
  end
end

puts "Problem # 9" ######

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map! do |ar|
  ar.sort {|a,b| b <=> a}
end

p arr

puts "Proplem # 10" ########

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_hash = arr.map do |hsh|
  hsh.each_with_object({}) do |(k, v), new_hsh|
    new_hsh[k] = v += 1
  end
end

p new_hash
p arr

puts "Problem 11" #########

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

arrz = arr.map do |element|
  element.select {|num| num % 3 == 0}
end

p arrz == [[], [3, 12], [9], [15]]

puts 'Problem 12' ########

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

arrz = arr.each_with_object({}) do |(k,v), hsh|
  hsh[k] = v
end


p arrz == {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

puts "Problem 13" ########

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

arrz = arr.sort_by do |subs|
  subs.reject {|num| num % 2 == 0}
end

p arrz  == [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

puts "Problem 14" ########

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arrz = hsh.each_with_object([]) do |(k,v), arr|
  arr << v[:colors].each {|ea| ea.capitalize!} if v[:type] == 'fruit'
  arr << v[:size].upcase if v[:type] == 'vegetable'
end

p arrz  == [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

puts "Problem 15" ######

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arrz = arr.select do |hsh|
  hsh.all? do |_,v|
    v.all? do |n|
      n.even?
    end
  end
end

p arrz

puts "Problem 16" #########

# def create_uuid
#   string = ''
#   chars = ('a'..'f').to_a + ('1'..'9').to_a
#   8.times {string << chars.sample}
#   string << '-'
#   4.times do
#     4.times {string << chars.sample}
#     string << '-'
#   end
#   12.times {string << chars.sample}
#   p string
# end

# create_uuid



def create_uuid
  section = [8,4,4,4,12]
  uuid = ''
  digits = ('a'..'f').to_a + ('1'..'9').to_a
  section.each do |sec|
    sec.times {uuid << digits.sample}
    uuid << '-'
  end
  uuid.slice!(-1)
  uuid
end
      
p create_uuid