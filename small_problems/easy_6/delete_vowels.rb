VOWELS = %w(A E I O U a e i o u)
def remove_vowels(strings)
  strings.map! do |string|
    string.chars.delete_if { |v| VOWELS.any?(v) }.join
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

# P: Input => array of strings, upercase and lower with spaces
# Output: return same array as input with vowels removed (a, e, i, o, u)
# E: each element a string
# D: mutate array in place
# Create array of vowels
# A: Delete vowels 