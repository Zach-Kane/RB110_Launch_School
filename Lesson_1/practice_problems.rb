# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# hash = flintstones.to_h { |element| [element, flintstones.index(element)] }

# p hash

####

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# puts ages.values.sum

####

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# ages.delete_if { |_, v| v > 100 }

# puts ages

####

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# p ages.key(ages.values.min)

####

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# index = flintstones.index { |element| element[0, 2] == 'Be' }

# puts index

####

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# flintstones.each {|name| name.slice!(3..-1)}

# p flintstones

####

# statement = "The Flintstones Rock"

# hash = Hash.new(0)

# statement.chars.each { |letter| hash[letter] += 1 }

# puts hash

####

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

# numbers = [1, 2, 3, 4]
# numbers.each_with_index do |number, index|
#   p "#{index}  #{numbers.inspect}  #{number}"
#   numbers.shift(1)
# end

####

# words = "the flintstones rock"

# words = words.split.map {|word| word.capitalize}.join(' ')

# puts words

####

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, values|
puts 'yes' if 1 + 2
end

#p x
