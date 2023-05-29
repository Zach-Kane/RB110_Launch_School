


def minilang(string)
  stack = []
  inputs = string.split.map do |input|
    if input.to_i.to_s == input
    input.to_i
    else
    input
    end
  end
  register = 0
  loop do
    input = inputs.shift
    if input.class == Integer
      register = input 
      next
    end
    case input
    when 'PUSH' then stack << register
    when "ADD" then register = register + stack.pop
    when "SUB" then register = register - stack.pop
    when "MULT" then register = register * stack.pop
    when "DIV" then register = register / stack.pop
    when "MOD" then register = register % stack.pop
    when "POP" then register = stack.pop
    when "PRINT" then puts register
    end
    break if inputs.empty?
  end
end
    
minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)