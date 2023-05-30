BLOCKS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'], ['G', 'T'], ['R','E'], ['F', 'S'], ['J', 'W'], ['H', 'U'], ['V', 'I'], ['L', 'Y'], ['Z', 'M']]
require 'pry'

def block_word?(word)
  blocks = BLOCKS.dup
  block_count = []
  word.upcase.chars.each do |letter|
    if blocks.index {|arr| arr.any?(letter)}
    block_count << blocks.slice!(blocks.index {|arr| arr.any?(letter)})
    end
  end
  block_count.size == word.length
end 

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true