def ascii_value(string)
  total = 0
  string.split('').each {|e| total += e.ord}
  total
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

# P: input: string => output: ASCII string value ( sum of ASCII values of every character in the string) an integer
# E: String#ord  to determine ASCII value
# D: Array
# A: Iterate over string
# Array to store string value.
# add value